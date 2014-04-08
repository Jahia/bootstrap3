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