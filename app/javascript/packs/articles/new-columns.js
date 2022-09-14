
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
        if (i==0) {
            fieldGroup.insertAdjacentHTML('beforeend', `<div class="single-dynamic-field-group">`);
            for (let j = 1; j <= propertiesNumberArray[i]; j++) {
                fieldGroup.insertAdjacentHTML('beforeend', `<label>Текст столбца</label>
                <textarea name="first" data-id="${i}" class="column${j}-field">${el[`column${j}`]}</textarea>`);
            }
            fieldGroup.insertAdjacentHTML('beforeend', `<button type="button" data-id="${i}" class="add-column-button">Добавить новый столбец</button>
      </div>`);
        }
        else {
            fieldGroup.insertAdjacentHTML('beforeend', `<div class="single-dynamic-field-group">`);
            for (let j = 1; j <= propertiesNumberArray[i]; j++) {
                fieldGroup.insertAdjacentHTML('beforeend', `<label>Текст столбца</label>
                <textarea name="first" data-id="${i}" class="column${j}-field">${el[`column${j}`]}</textarea>`);
            }
            fieldGroup.insertAdjacentHTML('beforeend', `<button type="button" data-id="${i}" class="add-column-button">Добавить новый столбец</button>
      </div>
      <button class="remove-input-button" data-id="${i}">Удалить поле ввода</button>
        </div>`);
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
            //console.log(event.target.dataset.id);
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