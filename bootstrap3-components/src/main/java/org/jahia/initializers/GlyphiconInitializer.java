/**
 * ==========================================================================================
 * =                   JAHIA'S DUAL LICENSING - IMPORTANT INFORMATION                       =
 * ==========================================================================================
 *
 *                                 http://www.jahia.com
 *
 *     Copyright (C) 2002-2017 Jahia Solutions Group SA. All rights reserved.
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
package org.jahia.initializers;

import org.jahia.services.content.JCRPropertyWrapper;
import org.jahia.services.content.nodetypes.ExtendedPropertyDefinition;
import org.jahia.services.content.nodetypes.initializers.ChoiceListValue;
import org.jahia.services.content.nodetypes.initializers.ModuleChoiceListInitializer;
import org.jahia.services.content.nodetypes.renderer.AbstractChoiceListRenderer;
import org.jahia.services.content.nodetypes.renderer.ModuleChoiceListRenderer;
import org.jahia.services.render.RenderContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.jcr.RepositoryException;
import javax.jcr.Value;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Map;


public class GlyphiconInitializer extends AbstractChoiceListRenderer implements ModuleChoiceListInitializer, ModuleChoiceListRenderer {

    private static final Logger logger = LoggerFactory.getLogger(GlyphiconInitializer.class);

    private String key;

    /**
     * {@inheritDoc}
     */
    protected static final String[] ICONS = {"glyphicon-adjust", "glyphicon-alert", "glyphicon-align-center", "glyphicon-align-justify", "glyphicon-align-left", "glyphicon-align-right", "glyphicon-apple", "glyphicon-arrow-down", "glyphicon-arrow-left", "glyphicon-arrow-right", "glyphicon-arrow-up", "glyphicon-asterisk", "glyphicon-baby-formula", "glyphicon-backward", "glyphicon-ban-circle", "glyphicon-barcode", "glyphicon-bed", "glyphicon-bell", "glyphicon-bishop", "glyphicon-bitcoin", "glyphicon-blackboard", "glyphicon-bold", "glyphicon-book", "glyphicon-bookmark", "glyphicon-briefcase", "glyphicon-btc", "glyphicon-bullhorn", "glyphicon-calendar", "glyphicon-camera", "glyphicon-cd", "glyphicon-certificate", "glyphicon-check", "glyphicon-chevron-down", "glyphicon-chevron-left", "glyphicon-chevron-right", "glyphicon-chevron-up", "glyphicon-circle-arrow-down", "glyphicon-circle-arrow-left", "glyphicon-circle-arrow-right", "glyphicon-circle-arrow-up", "glyphicon-cloud", "glyphicon-cloud-download", "glyphicon-cloud-upload", "glyphicon-cog", "glyphicon-collapse-down", "glyphicon-collapse-up", "glyphicon-comment", "glyphicon-compressed", "glyphicon-console", "glyphicon-copy", "glyphicon-copyright-mark", "glyphicon-credit-card", "glyphicon-cutlery", "glyphicon-dashboard", "glyphicon-download", "glyphicon-download-alt", "glyphicon-duplicate", "glyphicon-earphone", "glyphicon-edit", "glyphicon-education", "glyphicon-eject", "glyphicon-envelope", "glyphicon-equalizer", "glyphicon-erase", "glyphicon-eur", "glyphicon-euro", "glyphicon-exclamation-sign", "glyphicon-expand", "glyphicon-export", "glyphicon-eye-close", "glyphicon-eye-open", "glyphicon-facetime-video", "glyphicon-fast-backward", "glyphicon-fast-forward", "glyphicon-file", "glyphicon-film", "glyphicon-filter", "glyphicon-fire", "glyphicon-flag", "glyphicon-flash", "glyphicon-floppy-disk", "glyphicon-floppy-open", "glyphicon-floppy-remove", "glyphicon-floppy-save", "glyphicon-floppy-saved", "glyphicon-folder-close", "glyphicon-folder-open", "glyphicon-font", "glyphicon-forward", "glyphicon-fullscreen", "glyphicon-gbp", "glyphicon-gift", "glyphicon-glass", "glyphicon-globe", "glyphicon-grain", "glyphicon-hand-down", "glyphicon-hand-left", "glyphicon-hand-right", "glyphicon-hand-up", "glyphicon-hdd", "glyphicon-hd-video", "glyphicon-header", "glyphicon-headphones", "glyphicon-heart", "glyphicon-heart-empty", "glyphicon-home", "glyphicon-hourglass", "glyphicon-ice-lolly", "glyphicon-ice-lolly-tasted", "glyphicon-import", "glyphicon-inbox", "glyphicon-indent-left", "glyphicon-indent-right", "glyphicon-info-sign", "glyphicon-italic", "glyphicon-jpy", "glyphicon-king", "glyphicon-knight", "glyphicon-lamp", "glyphicon-leaf", "glyphicon-level-up", "glyphicon-link", "glyphicon-list", "glyphicon-list-alt", "glyphicon-lock", "glyphicon-log-in", "glyphicon-log-out", "glyphicon-magnet", "glyphicon-map-marker", "glyphicon-menu-down", "glyphicon-menu-hamburger", "glyphicon-menu-left", "glyphicon-menu-right", "glyphicon-menu-up", "glyphicon-minus", "glyphicon-minus-sign", "glyphicon-modal-window", "glyphicon-move", "glyphicon-music", "glyphicon-new-window", "glyphicon-object-align-bottom", "glyphicon-object-align-horizontal", "glyphicon-object-align-left", "glyphicon-object-align-right", "glyphicon-object-align-top", "glyphicon-object-align-vertical", "glyphicon-off", "glyphicon-oil", "glyphicon-ok", "glyphicon-ok-circle", "glyphicon-ok-sign", "glyphicon-open", "glyphicon-open-file", "glyphicon-option-horizontal", "glyphicon-option-vertical", "glyphicon-paperclip", "glyphicon-paste", "glyphicon-pause", "glyphicon-pawn", "glyphicon-pencil", "glyphicon-phone", "glyphicon-phone-alt", "glyphicon-picture", "glyphicon-piggy-bank", "glyphicon-plane", "glyphicon-play", "glyphicon-play-circle", "glyphicon-plus", "glyphicon-plus-sign", "glyphicon-print", "glyphicon-pushpin", "glyphicon-qrcode", "glyphicon-queen", "glyphicon-question-sign", "glyphicon-random", "glyphicon-record", "glyphicon-refresh", "glyphicon-registration-mark", "glyphicon-remove", "glyphicon-remove-circle", "glyphicon-remove-sign", "glyphicon-repeat", "glyphicon-resize-full", "glyphicon-resize-horizontal", "glyphicon-resize-small", "glyphicon-resize-vertical", "glyphicon-retweet", "glyphicon-road", "glyphicon-rub", "glyphicon-ruble", "glyphicon-save", "glyphicon-saved", "glyphicon-save-file", "glyphicon-scale", "glyphicon-scissors", "glyphicon-screenshot", "glyphicon-sd-video", "glyphicon-search", "glyphicon-send", "glyphicon-share", "glyphicon-share-alt", "glyphicon-shopping-cart", "glyphicon-signal", "glyphicon-sort", "glyphicon-sort-by-alphabet", "glyphicon-sort-by-alphabet-alt", "glyphicon-sort-by-attributes", "glyphicon-sort-by-attributes-alt", "glyphicon-sort-by-order", "glyphicon-sort-by-order-alt", "glyphicon-sound-5-1", "glyphicon-sound-6-1", "glyphicon-sound-7-1", "glyphicon-sound-dolby", "glyphicon-sound-stereo", "glyphicon-star", "glyphicon-star-empty", "glyphicon-stats", "glyphicon-step-backward", "glyphicon-step-forward", "glyphicon-stop", "glyphicon-subscript", "glyphicon-subtitles", "glyphicon-sunglasses", "glyphicon-superscript", "glyphicon-tag", "glyphicon-tags", "glyphicon-tasks", "glyphicon-tent", "glyphicon-text-background", "glyphicon-text-color", "glyphicon-text-height", "glyphicon-text-size", "glyphicon-text-width", "glyphicon-th", "glyphicon-th-large", "glyphicon-th-list", "glyphicon-thumbs-down", "glyphicon-thumbs-up", "glyphicon-time", "glyphicon-tint", "glyphicon-tower", "glyphicon-transfer", "glyphicon-trash", "glyphicon-tree-conifer", "glyphicon-tree-deciduous", "glyphicon-triangle-bottom", "glyphicon-triangle-left", "glyphicon-triangle-right", "glyphicon-triangle-top", "glyphicon-unchecked", "glyphicon-upload", "glyphicon-usd", "glyphicon-user", "glyphicon-volume-down", "glyphicon-volume-off", "glyphicon-volume-up", "glyphicon-warning-sign", "glyphicon-wrench", "glyphicon-xbt", "glyphicon-yen", "glyphicon-zoom-in", "glyphicon-zoom-out"};


    public List<ChoiceListValue> getChoiceListValues(ExtendedPropertyDefinition epd, String param, List<ChoiceListValue> values, Locale locale, Map<String, Object> context) {
        ArrayList<ChoiceListValue> results = new ArrayList<ChoiceListValue>();
        for (String t : ICONS) {
            results.add(new ChoiceListValue(t, t));
        }
        return results;
    }

    /**
     * {@inheritDoc}
     */
    public void setKey(String key) {
        this.key = key;
    }

    /**
     * {@inheritDoc}
     */
    public String getKey() {
        return key;
    }

    /**
     * {@inheritDoc}
     */
    public String getStringRendering(RenderContext context, JCRPropertyWrapper propertyWrapper) throws RepositoryException {
        final StringBuilder sb = new StringBuilder();

        if (propertyWrapper.isMultiple()) {
            sb.append('{');
            final Value[] values = propertyWrapper.getValues();
            for (Value value : values) {
                sb.append('[').append(value.getString()).append(']');
            }
            sb.append('}');
        } else {
            sb.append('[').append(propertyWrapper.getValue().getString()).append(']');
        }

        return sb.toString();
    }

    /**
     * {@inheritDoc}
     */
    public String getStringRendering(Locale locale, ExtendedPropertyDefinition propDef, Object propertyValue) throws RepositoryException {
        return "[" + propertyValue.toString() + "]";
    }
}