<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<%--@elvariable id="out" type="java.io.PrintWriter"--%>
<%--@elvariable id="script" type="org.jahia.services.render.scripting.Script"--%>
<%--@elvariable id="scriptInfo" type="java.lang.String"--%>
<%--@elvariable id="workspace" type="java.lang.String"--%>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>
<%--@elvariable id="currentResource" type="org.jahia.services.render.Resource"--%>
<%--@elvariable id="url" type="org.jahia.services.render.URLGenerator"--%>
<template:addResources type="css" resources="bootstrap.min.css"/>
<template:addResources type="javascript" resources="jquery.min.js"/>
<template:addResources type="javascript" resources="bootstrap.min.js"/>
<template:addResources type="javascript" resources="bootstrap-hover-dropdown.min.js"/>

<c:set var="navbarClass" value="navbar navbar-default"/>
<c:if test="${jcr:isNodeType(currentNode, 'bootstrap3mix:navbarAdvanced')}">
    <c:set var="navbarClass" value="${currentNode.properties['navbarClass'].string}"/>
    <c:set var="ulClass" value="${currentNode.properties['ulClass'].string}"/>
</c:if>
<button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
        data-target=".navbar-responsive-collapse">
    <span class="sr-only">Toggle navigation</span>
    <span class="icon-bar"></span>
    <span class="icon-bar"></span>
    <span class="icon-bar"></span>
</button>
<c:set var="siteName" value="${renderContext.site.properties['j:title'].string}"/>
<jcr:nodeProperty var="siteLogo" node="${renderContext.site}" name="siteLogo"/>
<c:choose>
    <c:when test="${!empty siteLogo.node}">
        <a class="navbar-brand" href="<c:url value='${url.base}${renderContext.site.home.path}.html'/>">
            <img id="logo-header" src="<c:url value='${siteLogo.node.url}' context='/'/>"
                 alt="${siteName}"/>
        </a>
    </c:when>
    <c:when test="${empty siteLogo.node && renderContext.editMode}">
        <a class="navbar-brand" href="<c:url value='${url.base}${renderContext.site.home.path}.html'/>">
            <img id="logo-header" src="<c:url value='${url.currentModule}/img/nologo.png' context='/'/>"
                 alt="${siteName}"/>
        </a>
    </c:when>
    <c:otherwise>
        <a class="navbar-brand" href="<c:url value='${url.base}${renderContext.site.home.path}.html'/>">
            ${siteName}
        </a>
    </c:otherwise>
</c:choose>