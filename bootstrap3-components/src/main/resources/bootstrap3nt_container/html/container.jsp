<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>
<%--@elvariable id="url" type="org.jahia.services.render.URLGenerator"--%>
<%--@elvariable id="currentResource" type="org.jahia.services.render.Resource"--%>
<template:addResources type="css" resources="bootstrap.min.css"/>

<c:set var="containerCssClass" value=""/>
<c:set var="containerHtmlID" value=""/>

<c:if test="${jcr:isNodeType(currentNode, 'bootstrap3mix:cssClass')}">
    <c:if test="${not empty currentNode.properties.cssClass}">
        <c:set var="containerCssClass" value=" ${currentNode.properties.cssClass.string}"/>
    </c:if>
</c:if>

<c:if test="${jcr:isNodeType(currentNode, 'bootstrap3mix:htmlID')}">
    <c:if test="${not empty currentNode.properties.htmlID}">
        <c:set var="containerHtmlID"> id="${currentNode.properties.htmlID.string}"</c:set>
    </c:if>
</c:if>

<div class="container${currentNode.properties.fluid.boolean ? '-fluid' : ''} ${containerCssClass}" ${containerHtmlID}>
    <template:area path="${currentNode.name}" areaAsSubNode="true"/>
</div>
