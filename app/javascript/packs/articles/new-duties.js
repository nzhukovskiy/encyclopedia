RefreshFieldListenersDuties();
/*document.querySelector(".form-submit-button").addEventListener("click", function() {
    console.log(fieldsArray);
});*/
let dutiesResField = document.querySelector("#article_duties");
let dutiesFieldsArray = [{
    "title": "",
    "start_date": "",
    "end_date" : "",
    "predecessor": "",
    "successor": ""
}];
if (dutiesResField.textContent !== "[]") {
    dutiesFieldsArray = JSON.parse(dutiesResField.textContent);
    updateViewDuties();
}

document.querySelector(".dynamic-fields-group-duties .add-input-button").addEventListener("click", function() {
    dutiesFieldsArray.push({
        "title": "",
        "start_date": "",
        "end_date" : "",
        "predecessor": "",
        "successor": ""
    })
    updateViewDuties();
});
function updateViewDuties() {
    let fieldGroup = document.querySelector(".dynamic-fields-group-duties .dynamic-fields");
    fieldGroup.innerHTML = '';
    dutiesFieldsArray.forEach( function(el, i) {
        if (i==0) {
            fieldGroup.insertAdjacentHTML('beforeend', `<div class="single-dynamic-field-group">
                <label>Название</label>
                <textarea name="title" data-id="${i}" class="title-field">${el.title}</textarea>
                <label>Дата начала</label>
                <textarea name="start_date" data-id="${i}" class="start_date-field">${el.start_date}</textarea>
                <label>Дата окончания</label>
                <textarea name="end_date" data-id="${i}" class="end_date-field">${el.end_date}</textarea>
                <label>Предшественник</label>
                <textarea name="predecessor" data-id="${i}" class="predecessor-field">${el.predecessor}</textarea>
                <label>Преемник</label>
                <textarea name="successor"  data-id="${i}" class="successor-field">${el.successor}</textarea>
              </div>`)
        }
        else {
            fieldGroup.insertAdjacentHTML('beforeend', `<div class="single-dynamic-field-group">
                <label>Название</label>
                <textarea name="title"  data-id="${i}" class="title-field">${el.title}</textarea>
                <label>Дата начала</label>
                <textarea name="start_date"  data-id="${i}" class="start_date-field">${el.start_date}</textarea>
                <label>Дата окончания</label>
                <textarea name="end_date"  data-id="${i}" class="end_date-field">${el.end_date}</textarea>
                <label>Предшественник</label>
                <textarea name="predecessor"  data-id="${i}" class="predecessor-field">${el.predecessor}</textarea>
                <label>Преемник</label>
                <textarea name="successor"  data-id="${i}" class="successor-field">${el.successor}</textarea>
              </div>
            <button class="remove-input-button" data-id="${i}">Удалить поле ввода</button>
        </div>`)
        }

    })
    RefreshAllListenersDuties();
    RefreshFieldListenersDuties(dutiesFieldsArray, dutiesResField);
    dutiesResField.textContent = JSON.stringify(dutiesFieldsArray);
}
function RefreshAllListenersDuties() {
    document.querySelectorAll(".dynamic-fields-group-duties .remove-input-button").forEach(el => {
        el.addEventListener("click", function(event) {
            dutiesFieldsArray.splice(event.target.dataset.id, 1);
            updateViewDuties();
            //console.log(event.target.dataset.id);
        })
    })
}
/*function RemoveSingleElement(event) {
    console.log(event.target.dataset.id);
    //fieldsArray.splice(event.target.dataset.id, 1);
}*/
function RefreshFieldListenersDuties() {
    document.querySelectorAll(".dynamic-fields-group-duties .title-field").forEach(el => {
        el.addEventListener("change", function(event) {
            dutiesFieldsArray[event.target.dataset.id].title = event.target.value;
            dutiesResField.textContent = JSON.stringify(dutiesFieldsArray);
        })
    })
    document.querySelectorAll(".dynamic-fields-group-duties .start_date-field").forEach(el => {
        el.addEventListener("change", function(event) {
            dutiesFieldsArray[event.target.dataset.id].start_date = event.target.value;
            dutiesResField.textContent = JSON.stringify(dutiesFieldsArray);
        })
    })
    document.querySelectorAll(".dynamic-fields-group-duties .end_date-field").forEach(el => {
        el.addEventListener("change", function(event) {
            dutiesFieldsArray[event.target.dataset.id].end_date = event.target.value;
            dutiesResField.textContent = JSON.stringify(dutiesFieldsArray);
        })
    })
    document.querySelectorAll(".dynamic-fields-group-duties .predecessor-field").forEach(el => {
        el.addEventListener("change", function(event) {
            dutiesFieldsArray[event.target.dataset.id].predecessor = event.target.value;
            dutiesResField.textContent = JSON.stringify(dutiesFieldsArray);
        })
    })
    document.querySelectorAll(".dynamic-fields-group-duties .successor-field").forEach(el => {
        el.addEventListener("change", function(event) {
            dutiesFieldsArray[event.target.dataset.id].successor = event.target.value;
            dutiesResField.textContent = JSON.stringify(dutiesFieldsArray);
        })
    })
}
/*function GenerateDynamicFields(domElement) {
    //let str = `section.${domElement} button.add-input-button`;
    let resField = document.querySelector("#article_resources");
    let fieldsArray = [{
        "key": "",
        "value": ""
    }];
    if (resField.textContent !== "[]") {
        fieldsArray = JSON.parse(resField.textContent);
        updateView();
    }

    let a = document.querySelector(`section.${domElement} button.add-input-button`);
    //console.log(str);
    console.log(a);
}*/