<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="s" uri="http://www.jahia.org/tags/search" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>
<template:addResources type="css" resources="bootstrap.min.css"/>
<template:addResources type="javascript" resources="jquery.js,bootstrap.min.js"/>
<jcr:nodeProperty node="${currentNode}" name="jcr:title" var="title"/>
<jcr:nodeProperty node="${currentNode}" name="j:styleName" var="styleName"/>
<jcr:nodeProperty node="${currentNode}" name="option" var="option"/>
<jcr:nodeProperty node="${currentNode}" name="inverse" var="inverse"/>
<c:set var="navbarClasses" value="" />
<c:if test="${not empty option and not empty option.string}">
    <c:set var="navbarClasses" value="${navbarClasses} ${option.string}" />
</c:if>
<c:if test="${not empty inverse and inverse.boolean}">
    <c:set var="navbarClasses" value="${navbarClasses} navbar-inverse" />
</c:if>
<c:if test="${not empty styleName}">
    <c:set var="navbarClasses" value="${navbarClasses} ${styleName.string}" />
</c:if>

<nav class="navbar navbar-default ${navbarClasses}">
    <div class="container${currentNode.properties.fluid.boolean ? '-fluid' : ''}">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse_${currentNode.identifier}" aria-expanded="false">
                <span class="sr-only"><fmt:message key="bootstrap3nt_enhancedNavBar.title.toggleNavigation"/></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="${renderContext.site.home.url}">
                <c:choose>
                    <c:when test="${jcr:isNodeType(renderContext.site, 'bootstrap3mix:siteLogo')}">
                        <img alt="<c:if test="${not empty title}">${fn:escapeXml(title.string)}</c:if>" src="${renderContext.site.properties['siteLogo'].node.url}" height="20"/>
                    </c:when>
                    <c:otherwise>
                        <c:if test="${not empty title}">${fn:escapeXml(title.string)}</c:if>
                    </c:otherwise>
                </c:choose>
            </a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="navbar-collapse_${currentNode.identifier}">
            <c:forEach items="${jcr:getChildrenOfType(currentNode, 'bootstrap3mix:navBarItem')}" var="child" varStatus="status">
                <template:module node="${child}" />
            </c:forEach>
            <c:if test="${renderContext.editMode}">
                <ul class="nav navbar-nav">
                    <li><template:module path="*"/></li>
                </ul>
            </c:if>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
