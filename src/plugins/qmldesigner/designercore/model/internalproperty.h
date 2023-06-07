// Copyright (C) 2016 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only WITH Qt-GPL-exception-1.0

#pragma once

#include "qmldesignercorelib_global.h"

#include <QVariant>

#include <memory>

namespace QmlDesigner {

namespace Internal {

class InternalBindingProperty;
class InternalSignalHandlerProperty;
class InternalSignalDeclarationProperty;
class InternalVariantProperty;
class InternalNodeListProperty;
class InternalNodeProperty;
class InternalNodeAbstractProperty;
class InternalNode;

using InternalNodePointer = std::shared_ptr<InternalNode>;

template<PropertyType propertyType>
struct TypeLookup
{};

template<>
struct TypeLookup<PropertyType::Binding>
{
    using Type = InternalBindingProperty;
};

template<>
struct TypeLookup<PropertyType::Node>
{
    using Type = InternalNodeProperty;
};

template<>
struct TypeLookup<PropertyType::NodeList>
{
    using Type = InternalNodeListProperty;
};

template<>
struct TypeLookup<PropertyType::None>
{};

template<>
struct TypeLookup<PropertyType::SignalDeclaration>
{
    using Type = InternalSignalDeclarationProperty;
};

template<>
struct TypeLookup<PropertyType::SignalHandler>
{
    using Type = InternalSignalHandlerProperty;
};

template<>
struct TypeLookup<PropertyType::Variant>
{
    using Type = InternalVariantProperty;
};

class QMLDESIGNERCORE_EXPORT InternalProperty : public std::enable_shared_from_this<InternalProperty>
{
public:
    friend InternalNode;
    using Pointer = std::shared_ptr<InternalProperty>;

    InternalProperty();
    virtual ~InternalProperty();

    virtual bool isValid() const;

    PropertyName name() const;

    bool isBindingProperty() const { return m_propertyType == PropertyType::Binding; }
    bool isVariantProperty() const { return m_propertyType == PropertyType::Variant; }
    bool isNodeListProperty() const { return m_propertyType == PropertyType::NodeList; }
    bool isNodeProperty() const { return m_propertyType == PropertyType::Node; }
    bool isNodeAbstractProperty() const
    {
        return m_propertyType == PropertyType::Node || m_propertyType == PropertyType::NodeList;
    }
    bool isSignalHandlerProperty() const { return m_propertyType == PropertyType::SignalHandler; }
    bool isSignalDeclarationProperty() const
    {
        return m_propertyType == PropertyType::SignalDeclaration;
    }
    PropertyType propertyType() const { return m_propertyType; }

    template<typename Type>
    auto toProperty()
    {
        Q_ASSERT(std::dynamic_pointer_cast<Type>(shared_from_this()));
        return std::static_pointer_cast<Type>(shared_from_this());
    }

    template<PropertyType propertyType>
    auto to()
    {
        if (propertyType == m_propertyType)
            return std::static_pointer_cast<typename TypeLookup<propertyType>::Type>(
                shared_from_this());

        return std::shared_ptr<typename TypeLookup<propertyType>::Type>{};
    }

    InternalNodePointer propertyOwner() const;

    virtual void remove();

    TypeName dynamicTypeName() const;

    void resetDynamicTypeName();

protected: // functions
    InternalProperty(const PropertyName &name,
                     const InternalNodePointer &propertyOwner,
                     PropertyType propertyType);

    void setDynamicTypeName(const TypeName &name);

private:
    PropertyName m_name;
    TypeName m_dynamicType;
    std::weak_ptr<InternalNode> m_propertyOwner;
    PropertyType m_propertyType = PropertyType::None;
};

} // namespace Internal
} // namespace QmlDesigner
