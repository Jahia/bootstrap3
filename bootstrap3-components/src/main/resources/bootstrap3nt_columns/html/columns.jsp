<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="functions" uri="http://www.jahia.org/tags/functions" %>
<%@ taglib prefix="ui" uri="http://www.jahia.org/tags/uiComponentsLib" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<%--@elvariable id="propertyDefinition" type="org.jahia.services.content.nodetypes.ExtendedPropertyDefinition"--%>
<%--@elvariable id="type" type="org.jahia.services.content.nodetypes.ExtendedNodeType"--%>
<%--@elvariable id="out" type="java.io.PrintWriter"--%>
<%--@elvariable id="script" type="org.jahia.services.render.scripting.Script"--%>
<%--@elvariable id="scriptInfo" type="java.lang.String"--%>
<%--@elvariable id="workspace" type="java.lang.String"--%>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>
<%--@elvariable id="currentResource" type="org.jahia.services.render.Resource"--%>
<%--@elvariable id="url" type="org.jahia.services.render.URLGenerator"--%>
<template:addResources type="css" resources="bootstrap.min.css"/>


<c:set var="createSection" value="${jcr:isNodeType(currentNode,'bootstrap3mix:createSection')}"/>
<c:set var="createContainer" value="${jcr:isNodeType(currentNode,'bootstrap3mix:createContainer')}"/>
<c:set var="createRow" value="${jcr:isNodeType(currentNode,'bootstrap3mix:createRow')}"/>

<c:set var="columnsType" value="${currentNode.properties.columnsType.string}"/>

<c:if test="${createSection}">
    <c:set var="sectionType" value="${currentNode.properties['sectionElement'].string}"/>
    <c:set var="sectionCssClass" value="${currentNode.properties['sectionCssClass'].string}"/>

    <c:set var="sectionId" value="${currentNode.properties['sectionId'].string}"/>
    <${sectionType}<c:if test="${! empty sectionId}"> id="${sectionId}"</c:if><c:if test="${! empty sectionCssClass}"><c:out value=" "/>class="${sectionCssClass}"</c:if>>
</c:if>

<c:if test="${createContainer}">
    <c:set var="containerId" value="${currentNode.properties['containerId'].string}"/>
    <c:set var="containerCssClass" value="${currentNode.properties['containerCssClass'].string}"/>
    <c:set var="gridLayout" value="${currentNode.properties['gridLayout'].string == 'full-width' ? 'container-fluid' : 'container'}"/>
    <div<c:if test="${! empty containerId}"> id="${containerId}"</c:if> class="${gridLayout}<c:if test="${! empty containerCssClass}"><c:out value=" "/>${containerCssClass}</c:if>">
</c:if>

<c:if test="${createRow}">
    <c:set var="rowId" value="${currentNode.properties['rowId'].string}"/>
    <c:set var="rowCssClass" value="${currentNode.properties['rowCssClass'].string}"/>
    <div<c:if test="${! empty rowId}"> id="${rowId}"</c:if> class="row<c:if test="${! empty rowCssClass}"><c:out value=" "/>${rowCssClass}</c:if>">
</c:if>

<template:module node="${currentNode}" view="hidden.${columnsType}" editable="false"/>

<c:if test="${createRow}">
    </div>
</c:if>

<c:if test="${createContainer}">
    </div>
</c:if>

<c:if test="${createSection}">
    </${sectionType}>
</c:if>
