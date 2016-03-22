<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>
<template:addResources type="css" resources="bootstrap.min.css"/>

<c:set var="rowCssClass" value=""/>
<c:set var="rowHtmlID" value=""/>

<c:if test="${jcr:isNodeType(currentNode, 'bootstrap3mix:cssClass')}">
    <c:if test="${not empty currentNode.properties.cssClass}">
        <c:set var="rowCssClass" value="${currentNode.properties.cssClass.string}"/>
    </c:if>
</c:if>

<c:if test="${jcr:isNodeType(currentNode, 'bootstrap3mix:htmlID')}">
    <c:if test="${not empty currentNode.properties.htmlID}">
        <c:set var="rowHtmlID"> id="${currentNode.properties.htmlID.string}"</c:set>
    </c:if>
</c:if>

<div class="row ${rowCssClass}" ${rowHtmlID}>
    <c:forEach items="${jcr:getChildrenOfType(currentNode, 'bootstrap3nt:column')}" var="child" varStatus="status">
        <c:set var="columnCssClass" value=""/>
        <c:set var="columnHtmlID" value=""/>

        <c:if test="${not empty child.properties.span and child.properties.span.long gt 0}">
            <c:set var="columnCssClass" value="col-md-${child.properties.span.long}"/>
        </c:if>
        <c:if test="${not empty child.properties.offset and child.properties.offset.long gt 0}">
            <c:set var="columnCssClass" value="${columnCssClass} col-md-offset-${child.properties.offset.long}"/>
        </c:if>

        <c:if test="${jcr:isNodeType(child, 'bootstrap3mix:columnExtraSmallDevices')}">
            <c:if test="${not empty child.properties.extraSmallDevicesSpan and child.properties.extraSmallDevicesSpan.long gt 0}">
                <c:set var="columnCssClass" value="${columnCssClass} col-xs-${child.properties.extraSmallDevicesSpan.long}"/>
            </c:if>
            <c:if test="${not empty child.properties.extraSmallDevicesOffset and child.properties.extraSmallDevicesOffset.long gt 0}">
                <c:set var="columnCssClass" value="${columnCssClass} col-xs-offset-${child.properties.extraSmallDevicesOffset.long}"/>
            </c:if>
        </c:if>
        <c:if test="${jcr:isNodeType(child, 'bootstrap3mix:columnSmallDevices')}">
            <c:if test="${not empty child.properties.smallDevicesSpan and child.properties.smallDevicesSpan.long gt 0}">
                <c:set var="columnCssClass" value="${columnCssClass} col-sm-${child.properties.smallDevicesSpan.long}"/>
            </c:if>
            <c:if test="${not empty child.properties.smallDevicesOffset and child.properties.smallDevicesOffset.long gt 0}">
                <c:set var="columnCssClass" value="${columnCssClass} col-sm-offset-${child.properties.smallDevicesOffset.long}"/>
            </c:if>
        </c:if>
        <c:if test="${jcr:isNodeType(child, 'bootstrap3mix:columnLargeDevices')}">
            <c:if test="${not empty child.properties.largeDevicesSpan and child.properties.largeDevicesSpan.long gt 0}">
                <c:set var="columnCssClass" value="${columnCssClass} col-lg-${child.properties.largeDevicesSpan.long}"/>
            </c:if>
            <c:if test="${not empty child.properties.largeDevicesOffset and child.properties.largeDevicesOffset.long gt 0}">
                <c:set var="columnCssClass" value="${columnCssClass} col-lg-offset-${child.properties.largeDevicesOffset.long}"/>
            </c:if>
        </c:if>

        <c:if test="${jcr:isNodeType(child, 'bootstrap3mix:cssClass')}">
            <c:if test="${not empty child.properties.cssClass}">
                <c:set var="columnCssClass" value="${columnCssClass} ${child.properties.cssClass.string}"/>
            </c:if>
        </c:if>

        <c:if test="${jcr:isNodeType(child, 'bootstrap3mix:htmlID')}">
            <c:if test="${not empty child.properties.htmlID}">
                <c:set var="columnHtmlID"> id="${child.properties.htmlID.string}"</c:set>
            </c:if>
        </c:if>

        <div class="${columnCssClass}" ${columnHtmlID}>
            <template:module node="${child}"/>
        </div>
    </c:forEach>
</div>
<c:if test="${renderContext.editMode}">
    <template:module path="*"/>
</c:if>
