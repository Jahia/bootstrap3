package org.jahia.initializers;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.jcr.PropertyType;

import org.jahia.data.templates.JahiaTemplatesPackage;
import org.jahia.registries.ServicesRegistry;
import org.jahia.services.content.nodetypes.ExtendedPropertyDefinition;
import org.jahia.services.content.nodetypes.ValueImpl;
import org.jahia.services.content.nodetypes.initializers.ChoiceListValue;
import org.jahia.services.content.nodetypes.initializers.ModuleChoiceListInitializer;
import org.jahia.utils.i18n.JahiaResourceBundle;
import org.slf4j.Logger;

public class MixinChoiceListInitializer implements ModuleChoiceListInitializer {

    private transient static Logger LOGGER = org.slf4j.LoggerFactory.getLogger(MixinChoiceListInitializer.class);

    private String key;

    JahiaResourceBundle rb = null;

    List<ChoiceListValue> vs = new ArrayList<ChoiceListValue>();

    public String getKey() {
        LOGGER.debug("getKey");
        return this.key;
    }
    public void setKey(String arg0) {
        this.key = arg0;
    }

    public List<ChoiceListValue> getChoiceListValues(ExtendedPropertyDefinition epd, String param,
                                                     List<ChoiceListValue> values, Locale locale, Map<String, Object> context) {

        rb = new JahiaResourceBundle(null, locale, getTemplatePackageName(epd));
    
    /* Ne pas oublier de vides la liste sinon on ajoute les valeurs en double, triple etc*/
        vs.clear();

        LOGGER.debug("Found parameters "+param);

        List<String> params = Arrays.asList(param.split(","));
        Iterator<String> it = params.iterator();
        // Iteration sur chacun des parametres passes dans le choicelist initializer
        while (it.hasNext()) {
            String aParam = it.next();
            LOGGER.debug("Processing parameters "+aParam+"...");
            List<String> parsedParam = Arrays.asList(aParam.split("="));

            // Deux parametres obligatoires
            if(parsedParam.size()==2){

                String paramName=parsedParam.get(0);
                LOGGER.debug("Detecting parameter name "+paramName);
                String paramValues=parsedParam.get(1);
                LOGGER.debug("Detecting parameter values "+paramValues);
                if("defaultValue".equals(paramName) && !epd.isMandatory()){

                    // Traitement de la valeur par defaut de la liste
                    addDefaultValueToList(epd, paramValues);
                    LOGGER.debug("Adding default Value "+paramValues);

                }else if("mixinValues".equals(paramName)){

                    // Le champ mixinValues est normalement multivalue
                    LOGGER.debug("paramValues "+paramValues);
                    if(paramValues.indexOf(';')!=-1){
              /* Plusieurs valeurs, il faut parser le ; */
                        List<String> parsedValues = Arrays.asList(paramValues.split(";"));
                        Iterator<String> itValue = parsedValues.iterator();
                        while (itValue.hasNext()) {
                            // Iteration sur chacun des mixin
                            String value = itValue.next();
                            addMixinToList(value.trim());
                        }
                    }else{
                        addMixinToList(paramValues.trim());
                    }

                }
            }

        }
        LOGGER.debug("taille "+vs.size());
        return vs;
    }

    private String getTemplatePackageName(ExtendedPropertyDefinition definition) {
        String systemId = definition.getDeclaringNodeType().getSystemId();
        if(systemId.equals("system-jahia")) {
            systemId = "Default Jahia Templates";
        }
        final JahiaTemplatesPackage tpkg = ServicesRegistry.getInstance().getJahiaTemplateManagerService()
                .getTemplatePackage(systemId);

        return tpkg != null ? tpkg.getName() : null;
    }

    private void addMixinToList(String mixinName){
        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("addMixin", mixinName);
        ChoiceListValue c =  new ChoiceListValue(getDefinitionLabel(mixinName), map, new ValueImpl(mixinName, PropertyType.STRING, false));
        vs.add(c);
    }

    private void addDefaultValueToList(ExtendedPropertyDefinition epd, String propertyName){
        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("defaultProperty",true);
        ChoiceListValue c =  new ChoiceListValue(getDefinitionLabel(epd.getResourceBundleKey()+"."+propertyName), map, new ValueImpl("",  PropertyType.STRING, false));
        vs.add(c);
    }

    private String getDefinitionLabel(String mixinName){
        LOGGER.debug("searching "+mixinName.replaceAll(":", "_")+" in JahiaResourceBundle");
        return rb.get(mixinName.replaceAll(":", "_"),mixinName);
    }

}
