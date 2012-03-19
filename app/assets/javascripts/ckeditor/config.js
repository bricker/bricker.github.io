CKEDITOR.editorConfig = function( config )
{
	// Define changes to default configuration here. For example:
	 config.language = 'en';
	config.extraPlugins = 'stylesheetparser';
	config.contentsCss = '/assets/application.css';
	// config.uiColor = '#AADC6E';
	config.toolbar = "Custom";
	config.toolbar_Custom = [
		{ name: 'document', items : [ 'Source','-','Preview' ] },
		{ name: 'paragraph', items : [ 'NumberedList','BulletedList','-','Outdent','Indent','-','Blockquote','-','JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock' ] },
		{ name: 'links', items : [ 'Link','Unlink' ] },
		{ name: 'insert', items : [ 'Image','Flash','Table','HorizontalRule' ] },
		'/',
		{ name: 'basicstyles', items : [ 'Bold','Italic','Underline','Strike','-','RemoveFormat' ] },
		{ name: 'styles', items : [ 'Styles','Format','Font','FontSize', 'TextColor' ] },
		{ name: 'tools', items : [ 'Maximize','-','About' ] }
	];
	
	config.height = "400px";
	config.skin = "kama";
};