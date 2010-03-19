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

function textileEditorPopupButton(id, display, popupClass, access, title) {
  var theButton = document.createElement("button");
  theButton.id = id;
  theButton.standard = false;

  var img = document.createElement('img');
  img.src = '/images/textile-editor/' + display;
  theButton.appendChild(img);

  theButton.access = access;   // set to -1 if tag does not need to be closed
  theButton.title = title;     // sets the title attribute of the button to give 'tool tips'
  theButton.onclick = function() { eval("new " + popupClass + "(this)" ); return false; };
  return theButton;
}

// Add the custom buttons
teButtons.push(new TextileEditorButtonSeparator(''));
teButtons.push(textileEditorPopupButton('ed_link', 'link.png',  'LinkPopup',  'l', 'Link'));
teButtons.push(textileEditorPopupButton('ed_img',  'image.png', 'ImagePopup', 'i', 'Image'));
