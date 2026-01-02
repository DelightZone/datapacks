const linesContainer = document.getElementById('lines');
const dialogueNameInput = document.getElementById('dialogueName');

// ----- Persistence -----
function saveData() {
    const data = {
        name: dialogueNameInput.value,
        lines: []
    };
    for (const lineDiv of linesContainer.children) {
        const lineData = {
            text: lineDiv.querySelector('textarea')?.value || '',
            delay: lineDiv.querySelector('.delay').value,
            autoskip: lineDiv.querySelector('.autoskip').value,
            sound: lineDiv.querySelector('.sound').value,
            func: lineDiv.querySelector('.function').value,
            command: lineDiv.querySelector('.command').value
        };
        data.lines.push(lineData);
    }
    localStorage.setItem('chatterData', JSON.stringify(data));
}

function loadData() {
    const saved = localStorage.getItem('chatterData');
    if (!saved) return;
    const data = JSON.parse(saved);
    dialogueNameInput.value = data.name || '';
    for (const l of data.lines) {
        const lineDiv = createLineBlock(false);
        if (l.text) lineDiv.querySelector('textarea').value = l.text;
        lineDiv.querySelector('.delay').value = l.delay || '';
        lineDiv.querySelector('.autoskip').value = l.autoskip || '';
        lineDiv.querySelector('.sound').value = l.sound || '';
        lineDiv.querySelector('.function').value = l.func || '';
        lineDiv.querySelector('.command').value = l.command || '';
    }
}

// ----- Create Line -----
function createLineBlock(save=true) {
    const lineDiv = document.createElement('div');
    lineDiv.className = 'line';
    lineDiv.draggable = true;

    lineDiv.innerHTML = `
		<div class="line-header">
			<label>Tellraw JSON</label>
			<button class="remove-line">Remove</button>
		</div>
        <textarea placeholder='[{"text": "Hello", "color": "white"}]'></textarea>
        <div class="line-fields">
            <div>
                <label>Delay</label>
                <input type="number" class="delay" placeholder="ticks">
            </div>
            <div>
                <label>Autoskip</label>
                <select class="autoskip">
                    <option value="">None</option>
                    <option value="true">True</option>
                    <option value="false">False</option>
                </select>
            </div>
            <div>
                <label>Sound</label>
                <input type="text" class="sound" placeholder='minecraft:block.note_block.pling'>
            </div>
            <div>
                <label>Function</label>
                <input type="text" class="function" placeholder='example_function'>
            </div>
            <div>
                <label>Command</label>
                <input type="text" class="command" placeholder='say Hello'>
            </div>
        </div>
    `;

    lineDiv.querySelector('.remove-line').onclick = () => { lineDiv.remove(); saveData(); };

    // Drag
    lineDiv.addEventListener('dragstart', e => { 
		// If the target is an input, textarea, select, or button, cancel drag
		const tag = e.target.tagName.toLowerCase();
		if (['input','textarea','select','button'].includes(tag)) {
			e.preventDefault();
			return;
		}

		e.dataTransfer.setData('text/plain', ''); // required for drag
		lineDiv.classList.add('dragging'); 
	});

    lineDiv.addEventListener('dragend', e => lineDiv.classList.remove('dragging'));

    linesContainer.appendChild(lineDiv);

    if(save) saveData();
    return lineDiv;
}

// ----- Event Listeners -----
document.getElementById('addLine').onclick = () => createLineBlock();
dialogueNameInput.addEventListener('input', saveData);
linesContainer.addEventListener('input', saveData);

// ----- Generate -----
function generateChatter() {
    const name = dialogueNameInput.value.trim() || 'example';
    const lines = [];

    [...linesContainer.children].forEach((lineDiv, index) => {
        const textArea = lineDiv.querySelector('textarea');
        let textJSON = null;

        if (textArea && textArea.value.trim()) {
            try {
                textJSON = JSON.parse(textArea.value);
                if (!Array.isArray(textJSON)) throw "Must be an array";
            } catch(e) {
                alert(`Invalid Tellraw JSON at line ${index + 1}: ${e}`);
                return;
            }
        }

        const obj = {};
        if (textJSON) obj.text = textJSON;

        const delay = lineDiv.querySelector('.delay').value.trim();
        if (delay) obj.delay = parseInt(delay);

        const autoskip = lineDiv.querySelector('.autoskip').value;
        if (autoskip) obj.autoskip = autoskip === 'true';

        const sound = lineDiv.querySelector('.sound').value.trim();
        if (sound) obj.sound = `h.f("${sound}")`;

        const func = lineDiv.querySelector('.function').value.trim();
        if (func) obj.function = `h.f("${func}")`;

        const command = lineDiv.querySelector('.command').value.trim();
        if (command) obj.command = `${command}`;

        lines.push(obj);
    });

    let code = `Chatter.new("${name}", [\n`;
    lines.forEach((line, idx) => {
        let parts = [];
        if(line.text) parts.push(`        text: ${JSON.stringify(line.text, null, 8)}`);
        if(line.delay !== undefined) parts.push(`        delay: ${line.delay}`);
        if(line.autoskip !== undefined) parts.push(`        autoskip: ${line.autoskip}`);
        if(line.sound) parts.push(`        sound: ${line.sound}`);
        if(line.function) parts.push(`        function: ${line.function}`);
        if(line.command) parts.push(`        command: "${line.command}"`);
        code += '    {\n' + parts.join(',\n') + '\n    }';
        if(idx < lines.length - 1) code += ',';
        code += '\n';
    });
    code += '])';

    document.getElementById('output').textContent = code;
}

document.getElementById('generate').onclick = generateChatter;

// ----- Drag-and-drop -----
linesContainer.addEventListener('dragover', e => {
    e.preventDefault();
    const dragging = linesContainer.querySelector('.dragging');
    const afterElement = [...linesContainer.children].reduce((closest, child) => {
        if(child === dragging) return closest;
        const box = child.getBoundingClientRect();
        const offset = e.clientY - box.top - box.height/2;
        if(offset < 0 && offset > closest.offset) return {offset: offset, element: child};
        return closest;
    }, {offset: Number.NEGATIVE_INFINITY}).element;
    if(afterElement) linesContainer.insertBefore(dragging, afterElement);
    else linesContainer.appendChild(dragging);
});

// Load saved data on start
loadData();
