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
<div class="navbar navbar-default" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                    data-target=".navbar-responsive-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <jcr:nodeProperty var="siteLogo" node="${renderContext.site}" name="siteLogo"/>
            <c:choose>
                <c:when test="${!empty siteLogo.node}">
                    <a class="navbar-brand" href="<c:url value='${url.base}${renderContext.site.home.path}.html'/>">
                        <img id="logo-header" src="<c:url value='${siteLogo.node.url}' context='/'/>"
                             alt="${siteLogo.node.displayableName}"/>
                    </a>
                </c:when>
                <c:when test="${empty siteLogo.node && renderContext.editMode}">
                    <a class="navbar-brand" href="<c:url value='${url.base}${renderContext.site.home.path}.html'/>">
                        <img id="logo-header" src="<c:url value='${url.currentModule}/img/nologo.png' context='/'/>"
                             alt=""/>
                    </a>
                </c:when>
            </c:choose>
        </div>

        <div class="collapse navbar-collapse navbar-responsive-collapse">
            <c:choose>
                <c:when test="${fn:startsWith(renderContext.mainResource.path,'/templateSets/')}">
                    <ul class="nav navbar-nav navbar-right">
                        <li class="dropdown active">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown"
                               data-delay="0"
                               data-close-others="false">
                                Section 1
                                <i class="icon-angle-down"></i>
                            </a>
                            <ul class="dropdown-menu">
                                <li><a href="#">Page 1</a></li>
                                <li><a href="#">Page 2</a></li>
                                <li><a href="#">Page 3</a></li>
                                <li><a href="#">Page 4</a></li>
                                <li><a href="#">Page 5</a></li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown"
                               data-delay="0"
                               data-close-others="false">
                                Section 1
                                <i class="icon-angle-down"></i>
                            </a>
                            <ul class="dropdown-menu">
                                <li><a href="#">Page 1</a></li>
                                <li><a href="#">Page 2</a></li>
                                <li><a href="#">Page 3</a></li>
                                <li><a href="#">Page 4</a></li>
                                <li><a href="#">Page 5</a></li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown"
                               data-delay="0"
                               data-close-others="false">
                                Section 3
                                <i class="icon-angle-down"></i>
                            </a>
                            <ul class="dropdown-menu">
                                <li><a href="#">Page 1</a></li>
                                <li><a href="#">Page 2</a></li>
                                <li><a href="#">Page 3</a></li>
                                <li><a href="#">Page 4</a></li>
                                <li><a href="#">Page 5</a></li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown"
                               data-delay="0"
                               data-close-others="false">
                                Section 4
                                <i class="icon-angle-down"></i>
                            </a>
                            <ul class="dropdown-menu">
                                <li><a href="#">Page 1</a></li>
                                <li><a href="#">Page 2</a></li>
                                <li><a href="#">Page 3</a></li>
                                <li><a href="#">Page 4</a></li>
                                <li><a href="#">Page 5</a></li>
                            </ul>
                        </li>

                        <li class="hidden-sm"><a class="search"><i class="icon-search search-btn"></i></a></li>
                    </ul>
                </c:when>
                <c:otherwise>
                    <template:module node="${currentNode}" view="menu"/>
                </c:otherwise>
            </c:choose>
            <div class="search-open">
                <div class="input-group">
                    <input type="text" class="form-control" placeholder="Search">
                        <span class="input-group-btn">
                            <button class="btn-u" type="button">Go</button>
                        </span>
                </div>
                <!-- /input-group -->
            </div>
        </div>
    </div>
</div>
