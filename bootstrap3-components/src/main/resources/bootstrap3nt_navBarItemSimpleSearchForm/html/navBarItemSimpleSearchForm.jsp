<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="s" uri="http://www.jahia.org/tags/search" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<template:addResources type="css" resources="bootstrap.min.css"/>
<template:addCacheDependency uuid="${currentNode.properties.result.string}"/>
<c:if test="${not empty currentNode.properties.result.node}">
    <c:url value='${url.base}${currentNode.properties.result.node.path}.html' var="searchUrl"/>
    <jcr:nodeProperty node="${currentNode}" name="position" var="position"/>
    <c:set var="pullClass" value="" />
    <c:if test="${not empty position}">
        <c:set var="pullClass" value=" navbar-${position.string}" />
    </c:if>
    <s:form method="post" class="navbar-form${pullClass}" action="${searchUrl}" role="search">
        <div class="form-group">
            <fmt:message key='bootstrap3nt_navBarItemSimpleSearchForm.startSearching' var="startSearching"/>
            <s:term match="all_words" id="searchTerm" searchIn="siteContent,tags,files"
                   class="search-query form-control" placeholder="${startSearching}"/>
            <s:site value="${renderContext.site.name}" includeReferencesFrom="systemsite" display="false"/>
            <s:language value="${renderContext.mainResource.locale}" display="false"/>
        </div>
    </s:form>
</c:if>