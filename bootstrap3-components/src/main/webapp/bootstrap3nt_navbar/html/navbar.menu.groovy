import org.jahia.services.content.JCRContentUtils
import org.jahia.services.render.RenderService
import org.jahia.services.render.Resource
import org.jahia.taglibs.jcr.node.JCRTagUtils

def maxDepth = 2;
def printMenu;
printMenu = { node, navMenuLevel ->
    if (node != null) {
        children = JCRContentUtils.getChildrenOfType(node, "jmix:navMenuItem")
        def ulIsOpen = false;

        children.eachWithIndex() { menuItem, index ->
            if (menuItem != null) {
                def itemPath = menuItem.path;
                def correctType = true;
                if (menuItem.isNodeType("jmix:navMenu")) {
                    correctType = false;
                }
                if (menuItem.properties['j:displayInMenu']) {
                    correctType = false;
                    menuItem.properties['j:displayInMenu'].each() {
                        correctType |= (it.node.identifier == currentNode.identifier)
                    }
                }
                if (correctType) {
                    hasChildren = navMenuLevel < maxDepth && JCRTagUtils.hasChildrenOfType(menuItem, "jnt:page,jnt:nodeLink,jnt:externalLink")
                    Resource resource = new Resource(menuItem, "html", "menuElement", currentResource.getContextConfiguration());
                    def render = RenderService.getInstance().render(resource, renderContext)
                    if (render != "") {
                        def inpath = renderContext.mainResource.node.path == itemPath || renderContext.mainResource.node.path.startsWith(itemPath + "/");
                        def active = menuItem.isNodeType("jmix:nodeReference") ?
                                renderContext.mainResource.node.path == menuItem.properties['j:node'].node.path :
                                renderContext.mainResource.node.path == itemPath;
                        listItemCssClass = "class=\"" + (inpath || active ? "active " : "") + (hasChildren && navMenuLevel > 1 ? "dropdown-menu" : "dropdown") + "\"";
                        description = menuItem.properties['jcr:description'];
                        linkTitle = description ? " title=\"${description.string}\"" : ""
                        link = menuItem.url;
                        if (navMenuLevel == 1  ) {
                            if (!ulIsOpen) {
                                ulClass = "nav navbar-nav navbar-right";
                                if (currentNode.isNodeType("bootstrap3mix:navbarAdvanced")) {
                                    ulClass = currentNode.properties['ulClass'].string;
                                }
                                println "<ul class=\"${ulClass}\">\n"
                                ulIsOpen = true;
                            }
                            if (hasChildren) {
                                print "<li ${listItemCssClass}>";
                                print "    <a href=\"${link}\" class=\"dropdown-toggle\" data-hover=\"dropdown\" data-delay=\"0\" data-close-others=\"false\" ${linkTitle}>";
                                print menuItem.displayableName;
                                if (hasChildren && navMenuLevel < maxDepth) {
                                    print "<i class=\"icon-angle-down\"></i>";
                                }
                                print "</a>";
                                if (hasChildren && navMenuLevel < maxDepth) {
                                    printMenu(menuItem, navMenuLevel + 1);
                                }
                                println "</li>";
                            } else {
                                println "<li ${listItemCssClass}><a href=\"${link}\"${linkTitle}> " + menuItem.displayableName + "</a></li>\n";
                            }
                        } else {
                            if (!ulIsOpen) {
                                println "<ul class=\"dropdown-menu\">"
                                ulIsOpen = true;
                            }
                            println "<li ${listItemCssClass}>";
                            print "<a href=\"${link} ${linkTitle}\">" + menuItem.displayableName + "</a>";
                            if (hasChildren && navMenuLevel < maxDepth) {
                                printMenu(menuItem, navMenuLevel + 1);
                            }

                            println "</li>";
                        }
                    }
                }

            }
        }
        if (ulIsOpen) {
            //if (navMenuLevel == 1) {
            //    print("<li class=\"hidden-sm\"><a class=\"search\"><i class=\"icon-search search-btn\"></i></a></li>");
            //}
            println("</ul>")
            ulIsOpen = false;
        }
    }


}

printMenu(currentNode.resolveSite.home, 1)
