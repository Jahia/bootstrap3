
CKEDITOR.stylesSet.add('text', [
    { name:'Title H2', element:'h2' },
    { name:'Title H3', element:'h3' },
    { name:'Title H4', element:'h4' },
    { name:'Title H5', element:'h5' },
    { name:'Bold', element:'span', attributes:{ 'class':'bold' } },
    { name:'Lead', element:'p', attributes:{ 'class':'lead' } },

    { name:'Blue Dark', element:'span', attributes:{ 'class':'color-blueDark' } },

    { name:'Image rounded', element:'img', attributes:{ 'class':'img-rounded' } },
    { name:'Image rounded and polaroid', element:'img', attributes:{ 'class':'img-rounded img-polaroid' } },
    { name:'Image circle', element:'img', attributes:{ 'class':'img-circle' } },
    { name:'Image polaroid', element:'img', attributes:{ 'class':'img-polaroid' } },
    { name:'Image circle and polaroid', element:'img', attributes:{ 'class':'img-circle img-polaroid' } },

    { name:'Label Default', element:'span', attributes:{ 'class':'label' } },
    { name:'Label Success', element:'span', attributes:{ 'class':'label label-success' } },
    { name:'Label Warning', element:'span', attributes:{ 'class':'label label-warning' } },
    { name:'Label Important', element:'span', attributes:{ 'class':'label label-important' } },
    { name:'Label Info', element:'span', attributes:{ 'class':'label label-info' } },
    { name:'Label Inverse', element:'span', attributes:{ 'class':'label label-inverse' } },


    { name:'Well Default', element:'div', attributes:{ 'class':'well' } },
    { name:'Well White', element:'div', attributes:{ 'class':'well well-white' } },

    { name:'Alert Default', element:'div', attributes:{ 'class':'alert' } },
    { name:'Alert Error', element:'div', attributes:{ 'class':'alert alert-error' } },
    { name:'Alert Success', element:'div', attributes:{ 'class':'alert alert-success' } },
    { name:'Alert Information', element:'div', attributes:{ 'class':'alert alert-info' } },

    { name:'Code', element:'code' },

    { name:'Pre', element:'pre', attributes:{'class':'prettyprint linenums'} }
]);

CKEDITOR.editorConfig = function (config) {
    config.contextPath = (typeof contextJsParameters != 'undefined') ? contextJsParameters.contextPath : '';
    config.language = (typeof contextJsParameters != 'undefined') ? contextJsParameters.uilang : 'en';
    config.contentlanguage = (typeof contextJsParameters != 'undefined') ? contextJsParameters.lang : 'en';
    config.siteUuid = (typeof contextJsParameters != 'undefined') ? contextJsParameters.siteUuid : '';

    config.filebrowserWindowWidth = '810';
    config.filebrowserWindowHeight = '650';
    config.filebrowserLinkWindowHeight = '800';
    config.filebrowserWindowFeatures = 'location=no,menubar=no,toolbar=no,dependent=yes,minimizable=no,modal=yes,alwaysRaised=yes,resizable=yes,scrollbars=yes';
    config.filebrowserWindowName = 'JahiaFileBrowser';
    config.filebrowserBrowseUrl = config.contextPath + '/engines/contentpicker.jsp?site=' + config.siteUuid + '&lang=' + config.contentlanguage + '&uilang=' + config.language;
    config.filebrowserImageBrowseUrl = config.contextPath + '/engines/contentpicker.jsp?type=imagepicker&site=' + config.siteUuid + '&lang=' + config.contentlanguage + '&uilang=' + config.language;
    config.filebrowserFlashBrowseUrl = config.contextPath + '/engines/contentpicker.jsp?mime=application%2Fx-shockwave-flash%2Cvideo%2Fx-flv&site=' + config.siteUuid + '&lang=' + config.contentlanguage + '&uilang=' + config.language;
    config.filebrowserLinkBrowseUrl = config.contextPath + '/engines/contentpicker.jsp?type=editoriallinkpicker&site=' + config.siteUuid + '&lang=' + config.contentlanguage + '&uilang=' + config.language;
    config.image_previewText = '';

    config.toolbar = 'Tinny';
    config.stylesSet = 'text';
    config.contentsCss = [ ((typeof contextJsParameters != 'undefined') ? contextJsParameters.contextPath : '') + '/modules/bootstrap3-components/css/bootstrap.css',((typeof contextJsParameters != 'undefined') ? contextJsParameters.contextPath : '') + '/modules/bootstrap3-components/css/font-awesome.css' ];

    config.templates_files = [ ((typeof contextJsParameters != 'undefined') ? contextJsParameters.contextPath : '') + '/modules/bootstrap3-components/javascript/cktemplates.js' ];


    config.toolbar_Tinny = [
        ['Source', '-', 'Templates', 'PasteText','SpellChecker','Styles'],
        ['Bold','Italic'],
        ['NumberedList', 'BulletedList', 'Outdent','Indent', 'Blockquote'],
        ['JustifyLeft','JustifyCenter','JustifyRight'],
        ['Link', 'Unlink','Anchor','Image'],
        ['RemoveFormat','HorizontalRule','ShowBlocks']
    ];

    config.extraPlugins = 'acheck';
    config.templates_replaceContent = false;

    // [ Left, Center, Right, Justified ]
    config.justifyClasses = [ 'text-left', 'text-center', 'text-right', 'text-justify' ];

};




CKEDITOR.dtd.$removeEmpty['i'] = 0;
