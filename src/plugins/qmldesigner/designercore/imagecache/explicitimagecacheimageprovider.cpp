// Copyright (C) 2022 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0+ OR GPL-3.0 WITH Qt-GPL-exception-1.0

#include "explicitimagecacheimageprovider.h"
#include "imagecacheimageresponse.h"

#include <asynchronousexplicitimagecache.h>

#include <QMetaObject>
#include <QQuickImageResponse>

namespace QmlDesigner {

QQuickImageResponse *ExplicitImageCacheImageProvider::requestImageResponse(const QString &id,
                                                                           const QSize &)
{
    auto response = std::make_unique<ImageCacheImageResponse>(m_defaultImage);

    m_cache.requestImage(
        id,
        [response = QPointer<ImageCacheImageResponse>(response.get())](const QImage &image) {
            QMetaObject::invokeMethod(
                response,
                [response, image] {
                    if (response)
                        response->setImage(image);
                },
                Qt::QueuedConnection);
        },
        [response = QPointer<ImageCacheImageResponse>(response.get())](
            ImageCache::AbortReason abortReason) {
            QMetaObject::invokeMethod(
                response,
                [response, abortReason] {
                    switch (abortReason) {
                    case ImageCache::AbortReason::Failed:
                        if (response)
                            response->abort();
                        break;
                    case ImageCache::AbortReason::Abort:
                        response->cancel();
                        break;
                    }
                },
                Qt::QueuedConnection);
        });

    return response.release();
}

} // namespace QmlDesigner
