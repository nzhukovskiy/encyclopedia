
/*document.querySelector(".form-submit-button").addEventListener("click", function() {
    console.log(fieldsArray);
});*/
let resFieldColumns = document.querySelector("#article_columns_data");
let fieldsArrayColumns = [{
    "column1": "",
    "column2": ""
}];
let propertiesNumberArray = [2];
if (resFieldColumns.textContent !== "[]") {
    fieldsArrayColumns = JSON.parse(resFieldColumns.textContent);
    propertiesNumberArray = [];
    fieldsArrayColumns.forEach(obj => {
        //console.log(obj);
        propertiesNumberArray.push(Object.keys(obj).length);
        //console.log(propertiesNumberArray);
    })
    updateViewColumns();
}

document.querySelector(".dynamic-fields-group-columns .add-input-button").addEventListener("click", function() {
    fieldsArrayColumns.push({
        "column1": "",
        "column2": ""
    })
    propertiesNumberArray.push(2);
    updateViewColumns();
});
RefreshFieldListenersColumns();
RefreshAddColumnButtons();
function updateViewColumns() {
    let fieldGroup = document.querySelector(".dynamic-fields-group-columns .dynamic-fields");
    fieldGroup.innerHTML = '';
    fieldsArrayColumns.forEach( function(el, i) {
        fieldGroup.insertAdjacentHTML('beforeend', `<div class="single-dynamic-field-group">`);
        for (let j = 1; j <= propertiesNumberArray[i]; j++) {
            fieldGroup.insertAdjacentHTML('beforeend', `<label>Текст столбца</label>
                <textarea name="first" data-id="${i}" class="column${j}-field">${el[`column${j}`]}</textarea>`);
        }
        fieldGroup.insertAdjacentHTML('beforeend', `<button type="button" data-id="${i}" class="add-column-button">Добавить новый столбец</button>`);
        if (propertiesNumberArray[i] > 1) {
            fieldGroup.insertAdjacentHTML('beforeend', `<div class="remove-column-group">
                <select class="row${i}-select">
                    Выберите колонку для удаления
                </select>
                <button type="button" data-id="${i}" class="remove-column-button">Удалить столбец</button>
            </div>`);
            for (let j = 1; j <= propertiesNumberArray[i]; j++) {
                let option = document.createElement("option");
                option.value = j;
                option.textContent = j;
                document.querySelector(`.row${i}-select`).appendChild(option);
            }
        }
        if (i==0) {
            fieldGroup.insertAdjacentHTML('beforeend',`</div>`);
        }
        else {
            fieldGroup.insertAdjacentHTML('beforeend',`<button class="remove-input-button" data-id="${i}">Удалить поле ввода</button></div>`);

        }

    })
    RefreshAllListenersColumns();
    RefreshFieldListenersColumns(fieldsArrayColumns, resFieldColumns);
    RefreshAddColumnButtons();
    resFieldColumns.textContent = JSON.stringify(fieldsArrayColumns);
}
function RefreshAllListenersColumns() {
    document.querySelectorAll(".dynamic-fields-group-columns .remove-input-button").forEach(el => {
        el.addEventListener("click", function(event) {
            fieldsArrayColumns.splice(event.target.dataset.id, 1);
            propertiesNumberArray.splice(event.target.dataset.id, 1);
            updateViewColumns();
        })
    })
}
function RefreshAddColumnButtons() {
    document.querySelectorAll(".dynamic-fields-group-columns .add-column-button").forEach(el => {
        el.addEventListener("click", function(event) {
            propertiesNumberArray[event.target.dataset.id]++;
            fieldsArrayColumns[event.target.dataset.id][`column${propertiesNumberArray[event.target.dataset.id]}`] = "";
            updateViewColumns();
        })
    })
    document.querySelectorAll(".dynamic-fields-group-columns .remove-column-button").forEach(el => {
        el.addEventListener("click", function(event) {
            let columnToRemove = document.querySelector(`.row${event.target.dataset.id}-select`).value;
            delete fieldsArrayColumns[event.target.dataset.id][`column${columnToRemove}`];
            propertiesNumberArray[event.target.dataset.id]--;
            ShiftColumnProperties(event.target.dataset.id, parseInt(columnToRemove)+1);
            updateViewColumns();
        })
    })
}
function RefreshFieldListenersColumns() {
    let maxPropertiesCount = Math.max.apply(Math, propertiesNumberArray);
    for (let i = 1; i <= maxPropertiesCount; i++) {
        document.querySelectorAll(`.dynamic-fields-group-columns .column${i}-field`).forEach(el => {
            el.addEventListener("change", function(event) {
                fieldsArrayColumns[event.target.dataset.id][`column${i}`] = event.target.value;
                resFieldColumns.textContent = JSON.stringify(fieldsArrayColumns);
            })
        })
    }
}
function ShiftColumnProperties(rowIndex, startColumn, offset=-1) {
    for (let i = startColumn; i <= propertiesNumberArray[rowIndex] + 1; i++) {
        let temp = fieldsArrayColumns[rowIndex][`column${i}`];
        fieldsArrayColumns[rowIndex][`column${i+offset}`] = temp;
        delete fieldsArrayColumns[rowIndex][`column${i}`];
    }
}