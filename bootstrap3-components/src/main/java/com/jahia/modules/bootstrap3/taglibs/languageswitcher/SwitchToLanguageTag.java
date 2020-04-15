/*
 * ==========================================================================================
 * =                   JAHIA'S DUAL LICENSING - IMPORTANT INFORMATION                       =
 * ==========================================================================================
 *
 *                                 http://www.jahia.com
 *
 *     Copyright (C) 2002-2020 Jahia Solutions Group SA. All rights reserved.
 *
 *     THIS FILE IS AVAILABLE UNDER TWO DIFFERENT LICENSES:
 *     1/GPL OR 2/JSEL
 *
 *     1/ GPL
 *     ==================================================================================
 *
 *     IF YOU DECIDE TO CHOOSE THE GPL LICENSE, YOU MUST COMPLY WITH THE FOLLOWING TERMS:
 *
 *     This program is free software: you can redistribute it and/or modify
 *     it under the terms of the GNU General Public License as published by
 *     the Free Software Foundation, either version 3 of the License, or
 *     (at your option) any later version.
 *
 *     This program is distributed in the hope that it will be useful,
 *     but WITHOUT ANY WARRANTY; without even the implied warranty of
 *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 *     GNU General Public License for more details.
 *
 *     You should have received a copy of the GNU General Public License
 *     along with this program. If not, see <http://www.gnu.org/licenses/>.
 *
 *
 *     2/ JSEL - Commercial and Supported Versions of the program
 *     ===================================================================================
 *
 *     IF YOU DECIDE TO CHOOSE THE JSEL LICENSE, YOU MUST COMPLY WITH THE FOLLOWING TERMS:
 *
 *     Alternatively, commercial and supported versions of the program - also known as
 *     Enterprise Distributions - must be used in accordance with the terms and conditions
 *     contained in a separate written agreement between you and Jahia Solutions Group SA.
 *
 *     If you are unsure which license is appropriate for your use,
 *     please contact the sales department at sales@jahia.com.
 */
package com.jahia.modules.bootstrap3.taglibs.languageswitcher;

import org.jahia.taglibs.AbstractJahiaTag;
import org.jahia.utils.LanguageCodeConverters;
import org.slf4j.Logger;

import java.io.IOException;
import java.util.Locale;

public class SwitchToLanguageTag extends AbstractJahiaTag {

    private static final transient Logger logger = org.slf4j.LoggerFactory.getLogger(SwitchToLanguageTag.class);

    private String languageCode;


    public String getLanguageCode() {
        return languageCode;
    }

    public void setLanguageCode(String languageCode) {
        this.languageCode = languageCode;
    }

    public int doStartTag() {
        try {
            final StringBuilder buff = new StringBuilder(101);

            final String currentLocale = getCurrentResource().getLocale().getLanguage();
            final Locale locale = LanguageCodeConverters.languageCodeToLocale(languageCode);
            final String displayLanguage = locale.getDisplayLanguage(locale);
            final String link = generateCurrentNodeLangSwitchLink(languageCode);

            // finish anchor tag
            if (currentLocale.equals(languageCode)) {
                buff.append("<li class='active'><a title='").append(displayLanguage).append("' href='").
                        append(link).append("'>").append(displayLanguage).
                        append(" <i class='icon-ok'></i></a></li>");
            } else {
                buff.append("<li><a title='").append(displayLanguage).append("' href='").
                        append(link).append("'>").append(displayLanguage).
                        append("</a></li>");
            }

            pageContext.getOut().print(buff.toString());
        } catch (IOException e) {
            logger.error("Error while getting language switch URL", e);
        }

        return SKIP_BODY;
    }
}