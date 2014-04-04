package org.jahia.initializers;

/**
 * Created with IntelliJ IDEA.
 * User: pol
 * Date: 08.11.12
 * Time: 11:06
 * To change this template use File | Settings | File Templates.
 */

import org.jahia.services.content.JCRPropertyWrapper;
import org.jahia.services.content.nodetypes.ExtendedPropertyDefinition;
import org.jahia.services.content.nodetypes.ValueImpl;
import org.jahia.services.content.nodetypes.initializers.ChoiceListValue;
import org.jahia.services.content.nodetypes.initializers.ModuleChoiceListInitializer;
import org.jahia.services.content.nodetypes.renderer.AbstractChoiceListRenderer;
import org.jahia.services.content.nodetypes.renderer.ModuleChoiceListRenderer;
import org.jahia.services.render.RenderContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.jcr.PropertyType;
import javax.jcr.RepositoryException;
import javax.jcr.Value;
import java.util.*;


public class SliderInitializer extends AbstractChoiceListRenderer implements ModuleChoiceListInitializer, ModuleChoiceListRenderer {

    private static final Logger logger = LoggerFactory.getLogger(SliderInitializer.class);

    private String key;

    /**
     * {@inheritDoc}
     */
    public List<ChoiceListValue> getChoiceListValues(ExtendedPropertyDefinition epd, String param, List<ChoiceListValue> values,
                                                     Locale locale, Map<String, Object> context) {

        //Create the list of ChoiceListValue to return
        List<ChoiceListValue> myChoiceList = new ArrayList<ChoiceListValue>();

        if (context == null) {
            return myChoiceList;
        }

        HashMap<String, Object> myPropertiesMap = null;

        //banner
        myPropertiesMap = new HashMap<String, Object>();
        myChoiceList.add(new ChoiceListValue("banner",myPropertiesMap,new ValueImpl("banner", PropertyType.STRING, false)));

        //logo
        myPropertiesMap = new HashMap<String, Object>();
        myPropertiesMap.put("addMixin","bootstrap3mix:title");
        myChoiceList.add(new ChoiceListValue("logo",myPropertiesMap,new ValueImpl("logo", PropertyType.STRING, false)));
        
        //testimonial
        myPropertiesMap = new HashMap<String, Object>();
        myChoiceList.add(new ChoiceListValue("testimonial",myPropertiesMap,new ValueImpl("testimonial", PropertyType.STRING, false)));
        
        //photo
        myPropertiesMap = new HashMap<String, Object>();
        myPropertiesMap.put("addMixin","bootstrap3mix:title");
        myChoiceList.add(new ChoiceListValue("photo",myPropertiesMap,new ValueImpl("photo", PropertyType.STRING, false)));
        
      //Return the list
        return myChoiceList;
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
