// Copyright (C) 2016 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only WITH Qt-GPL-exception-1.0

#pragma once

#include "utils_global.h"

#include <memory>

namespace Utils {

QTCREATOR_UTILS_EXPORT void writeAssertLocation(const char *msg);
QTCREATOR_UTILS_EXPORT void dumpBacktrace(int maxdepth);

class ScopedTimerPrivate;

class QTCREATOR_UTILS_EXPORT ScopedTimer
{
public:
    ScopedTimer(const char *fileName, int line);
    ~ScopedTimer();

private:
    std::unique_ptr<ScopedTimerPrivate> d;
};

} // Utils

#define QTC_ASSERT_STRINGIFY_HELPER(x) #x
#define QTC_ASSERT_STRINGIFY(x) QTC_ASSERT_STRINGIFY_HELPER(x)
#define QTC_ASSERT_STRING(cond) ::Utils::writeAssertLocation(\
    "\"" cond"\" in " __FILE__ ":" QTC_ASSERT_STRINGIFY(__LINE__))

// The 'do {...} while (0)' idiom is not used for the main block here to be
// able to use 'break' and 'continue' as 'actions'.

#define QTC_ASSERT(cond, action) if (Q_LIKELY(cond)) {} else { QTC_ASSERT_STRING(#cond); action; } do {} while (0)
#define QTC_CHECK(cond) if (Q_LIKELY(cond)) {} else { QTC_ASSERT_STRING(#cond); } do {} while (0)
#define QTC_GUARD(cond) ((Q_LIKELY(cond)) ? true : (QTC_ASSERT_STRING(#cond), false))

#define QTC_CONCAT_HELPER(x, y) x ## y
#define QTC_CONCAT(x, y) QTC_CONCAT_HELPER(x, y)
#define QTC_SCOPED_TIMER() ::Utils::ScopedTimer QTC_CONCAT(_qtc_scoped_timer_, __LINE__)(__FILE__, __LINE__)
