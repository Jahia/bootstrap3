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
<c:set var="level" value="${currentNode.properties['level'].long}"/>
<c:choose>
    <c:when test="${level == 0}">
        <c:set var="root" value="${jcr:getParentOfType(renderContext.mainResource.node, 'jnt:page')}"/>
    </c:when>
    <c:otherwise>
        <c:forEach items="${jcr:getParentsOfType(renderContext.mainResource.node, 'jnt:page')}" var="item">
            <c:if test="${item.depth eq level + 2}">
                <c:set var="root" value="${item}"/>
            </c:if>
        </c:forEach>
    </c:otherwise>
</c:choose>

<c:choose>
    <c:when test="${! empty root}">
        <div class="list-group">
            <c:forEach items="${jcr:getChildrenOfType(root, 'jnt:page,jnt:nodeLink,jnt:externalLink')}"
                       var="menuItem">
                <c:set var="active" value="${jcr:isNodeType(menuItem,'jmix:nodeReference') ?
            renderContext.mainResource.node.path == menuItem.properties['j:node'].node.path :
            renderContext.mainResource.node.path == menuItem.path}"/>
                <c:set var="aClass" value="${active ? 'list-group-item active' : 'list-group-item'}"/>
                <c:url var="linkUrl" value="${menuItem.url}"/>
                <a href="${linkUrl}" class="${aClass}">${menuItem.displayableName}</a>
            </c:forEach>
        </div>
    </c:when>
    <c:when test="${empty root && renderContext.editMode}">
        <div class="list-group">
            <a href="#" class="list-group-item active">
                Cras justo odio
            </a>
            <a href="#" class="list-group-item">Dapibus ac facilisis in</a>
            <a href="#" class="list-group-item">Morbi leo risus</a>
            <a href="#" class="list-group-item">Porta ac consectetur ac</a>
            <a href="#" class="list-group-item">Vestibulum at eros</a>
        </div>
    </c:when>
</c:choose>