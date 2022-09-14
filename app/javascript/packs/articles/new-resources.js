RefreshFieldListeners();
/*document.querySelector(".form-submit-button").addEventListener("click", function() {
    console.log(fieldsArray);
});*/
let resField = document.querySelector("#article_resources");
let fieldsArray = [{
    "key": "",
    "value": ""
}];
if (resField.textContent !== "[]") {
    fieldsArray = JSON.parse(resField.textContent);
    updateView();
}

document.querySelector(".dynamic-fields-group-resources .add-input-button").addEventListener("click", function() {
    fieldsArray.push({
        "key": "",
        "value": ""
    })
    updateView();
});
function updateView() {
    let fieldGroup = document.querySelector(".dynamic-fields-group-resources .dynamic-fields");
    fieldGroup.innerHTML = '';
    fieldsArray.forEach( function(el, i) {
        if (i==0) {
            fieldGroup.insertAdjacentHTML('beforeend', `<div class="single-dynamic-field-group">
            <label>Ключ</label>
            <textarea name="first" type="text" data-id="${i}" class="first-field">${el.key}</textarea>
            <label>Значение</label>
            <textarea name="second" type="text" data-id="${i}" class="second-field">${el.value}</textarea>
        </div>`)
        }
        else {
            fieldGroup.insertAdjacentHTML('beforeend', `<div class="single-dynamic-field-group">
            <label>Ключ</label>
            <textarea name="first" type="text" data-id="${i}" class="first-field">${el.key}</textarea>
            <label>Значение</label>
            <textarea name="second" type="text" data-id="${i}" class="second-field">${el.value}</textarea>
            <button class="remove-input-button" data-id="${i}">Удалить поле ввода</button>
        </div>`)
        }

    })
    RefreshAllListeners();
    RefreshFieldListeners(fieldsArray, resField);
    resField.textContent = JSON.stringify(fieldsArray);
}
function RefreshAllListeners() {
    document.querySelectorAll(".dynamic-fields-group-resources .remove-input-button").forEach(el => {
        el.addEventListener("click", function(event) {
            fieldsArray.splice(event.target.dataset.id, 1);
            updateView();
            //console.log(event.target.dataset.id);
        })
    })
}
function RemoveSingleElement(event) {
    console.log(event.target.dataset.id);
    //fieldsArray.splice(event.target.dataset.id, 1);
}
function RefreshFieldListeners() {
    document.querySelectorAll(".dynamic-fields-group-resources .first-field").forEach(el => {
        el.addEventListener("change", function(event) {
            fieldsArray[event.target.dataset.id].key = event.target.value;
            resField.textContent = JSON.stringify(fieldsArray);
        })
    })
    document.querySelectorAll(".dynamic-fields-group-resources .second-field").forEach(el => {
        el.addEventListener("change", function(event) {
            fieldsArray[event.target.dataset.id].value = event.target.value;
            resField.textContent = JSON.stringify(fieldsArray);
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