package options;

class ViroViroOptionsSubState extends BaseOptionsMenu
{
    public function new() {
        super(Language.getPhrase('vvie_menu', 'Engine Settings'), 'Engine Settings Menu');
		

		var option:Option = new Option('Mechanics',
			'Enables mechanics.',
			'mechanics',
			BOOL);
		addOption(option);

        var option:Option = new Option('Modchart',
			'Enables modchart.',
			'modchart',
			BOOL);
		addOption(option);

		var option:Option = new Option('Week 6 Pixel Rendering',
			'Enables that one removed week 6 pixel perfect rendering.',
			'weekpixel',
			BOOL);
		addOption(option);

        var option:Option = new Option('Extra',
			'Eles estao de olho em nois da silva.',
			'extra',
			BOOL);
		addOption(option);

    }
}