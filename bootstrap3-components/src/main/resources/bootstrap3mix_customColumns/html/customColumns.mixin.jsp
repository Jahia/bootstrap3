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

<c:set var="columns" value="${currentNode.properties['gridClasses'].string}"/>
<c:set var="colName" value="${currentNode.name}"/>
<c:set var="containerCssClass" value="${currentNode.properties['containerCssClass'].string}"/>
<c:set var="gridLayout" value="${currentNode.properties['gridLayout'].string == 'full-width' ? 'container-fluid' : 'container'}"/>

<c:set var="createAbsoluteAreas" value="${jcr:isNodeType(currentNode, 'bootstrap3mix:createAbsoluteAreas')}"/>
<c:set var="moduleType" value="${createAbsoluteAreas? 'absoluteArea' : 'area'}"/>
<c:set var="level" value="${createAbsoluteAreas? currentNode.properties['level'].string : '0'}"/>

<div class="${gridLayout} ${containerClass}">
    <div class="row">
        <c:forTokens items="${columns}" delims="," varStatus="status" var="col">
            <div class="${fn:trim(col)}"><template:area path="${colName}-col${status.index}" areaAsSubNode="true"
                                                        moduleType="${moduleType}" level="${level}"/></div>
        </c:forTokens>
    </div>
</div>
