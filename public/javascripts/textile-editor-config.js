var teButtons = TextileEditor.buttons;

teButtons.push(new TextileEditorButton('ed_strong',     'bold.png',          '*',   '*',  'b', 'Bold','s'));
teButtons.push(new TextileEditorButton('ed_emphasis',   'italic.png',        '_',   '_',  'i', 'Italicize','s'));
teButtons.push(new TextileEditorButton('ed_underline',  'underline.png',     '+',   '+',  'u', 'Underline','s'));
teButtons.push(new TextileEditorButton('ed_strike',     'strikethrough.png', '-',   '-',  's', 'Strikethrough','s'));
teButtons.push(new TextileEditorButton('ed_ol',         'list_numbers.png',  '# ', '\n', ',', 'Numbered List'));
teButtons.push(new TextileEditorButton('ed_ul',         'list_bullets.png',  '* ', '\n', '.', 'Bulleted List'));
teButtons.push(new TextileEditorButton('ed_p',          'paragraph.png',     'p',   '\n', 'p', 'Paragraph'));
teButtons.push(new TextileEditorButton('ed_h1',         'h1.png',            'h1',  '\n', '1', 'Header 1'));
teButtons.push(new TextileEditorButton('ed_h2',         'h2.png',            'h2',  '\n', '2', 'Header 2'));
teButtons.push(new TextileEditorButton('ed_h3',         'h3.png',            'h3',  '\n', '3', 'Header 3'));
teButtons.push(new TextileEditorButton('ed_h4',         'h4.png',            'h4',  '\n', '4', 'Header 4'));
teButtons.push(new TextileEditorButton('ed_block',      'blockquote.png',    'bq',  '\n', 'q', 'Blockquote'));
teButtons.push(new TextileEditorButton('ed_outdent',    'outdent.png',       ')',   '\n', ']', 'Outdent'));
teButtons.push(new TextileEditorButton('ed_indent',     'indent.png',        '(',   '\n', '[', 'Indent'));
teButtons.push(new TextileEditorButton('ed_justifyl',   'left.png',          '<',   '\n', 'l', 'Left Justify'));
teButtons.push(new TextileEditorButton('ed_justifyc',   'center.png',        '=',   '\n', 'e', 'Center Text'));
teButtons.push(new TextileEditorButton('ed_justifyr',   'right.png',         '>',   '\n', 'r', 'Right Justify'));
teButtons.push(new TextileEditorButton('ed_justify',    'justify.png',       '<>',  '\n', 'j', 'Justify'));

// -----------------------------------------------------------
//  Custom button additions
// -----------------------------------------------------------

teButtons.push(new TextileEditorButtonSeparator(''));
teButtons.push("<button id=\"ed_link\" onclick=\"new LinkPopup(this);return false;\" accesskey=\"l\" class=\"standard\"><img src=\"/images/textile-editor/link.png\" title=\"Link\" alt=\"Link\" /></button>");
teButtons.push("<button id=\"ed_img\" onclick=\"new ImagePopup(this);return false;\" accesskey=\"i\" class=\"standard\"><img src=\"/images/textile-editor/image.png\" title=\"Image\" alt=\"Image\" /></button>");
