<form class="form form--add-lot container <?= count($errors) ?  " form--invalid" : ""; ?>" action="add.php" method="POST" enctype="multipart/form-data"> <!-- form--invalid -->
        <h2>Добавление лота</h2>
        <div class="form__container-two">
            <div class="form__item <?=isset($errors['lot_name']) ? 'form__item--invalid' : '';?>"> <!-- form__item--invalid -->
                <label for="lot-name">Наименование</label>
                <input id="lot-name" type="text" name="lot_name" placeholder="Введите наименование лота" value="<?=$_POST['lot_name'];?>">
                <span class="form__error"><?=$errors['lot_name']; ?></span>
            </div>
            <div class="form__item <?=isset($errors['category_name']) ? 'form__item--invalid' : '';?>">
                <label for="category">Категория</label>
                <select id="category" name="category_name" >
                    <option value="standard_category">Выберите категорию</option>
                    <?php foreach ($categories as $key): ?>

                        <option value="<?= $key['category_id']; ?>" > <?= $key['category_name']; ?> </option>
                    <?php endforeach; ?>
                </select>

                <span class="form__error"><?=$errors['category_name'];?></span>
            </div>
        </div>
        <div class="form__item form__item--wide <?=isset($errors['message']) ? 'form__item--invalid' : '';?>">
            <label for="message">Описание</label>
            <textarea id="message" name="message" placeholder="Напишите описание лота" ><?=$_POST['message'];?></textarea>
            <span class="form__error"><?=$errors['message'];?> </span>
        </div>
        <div class="form__item form__item--file <?=isset($errors['lot_file']) ? 'form__item--invalid' : '';?>"> <!-- form__item--uploaded -->
            <label>Изображение</label>
            <div class="preview">
                <button class="preview__remove" type="button">x</button>
                <div class="preview__img">
                    <img src="img/avatar.jpg" class="img" width="113" height="113" alt="Изображение лота">
                </div>
            </div>
            <div class="form__input-file">
                <input class="visually-hidden" name="lot_file" type="file" id="lot_img" onchange="previewFile()" value="">
                <label for="lot_img">
                    <span class="">+ Добавить</span>
                </label>
                <img src="" height="200" alt="Предпросмотр картинки...">
            </div>
            <span class="form__error"><?=isset($errors['lot_file']) ? $errors['lot_file'] : '';?></span>
        </div>
        <div class="form__container-three">
            <div class="form__item form__item--small <?=isset($errors['lot_rate']) ? 'form__item--invalid' : '';?>">
                <label for="lot-rate">Начальная цена</label>
                <input id="lot-rate" type="number" name="lot_rate" placeholder="0" value="<?=$_POST['lot_rate'];?>">
                <span class="form__error"><?=$errors['lot_rate'];?> </span>
            </div>
            <div class="form__item form__item--small <?=isset($errors['lot_step']) ? 'form__item--invalid' : '';?>">
                <label for="lot-step">Шаг ставки</label>
                <input id="lot-step" type="number" name="lot_step" placeholder="0" value="<?=$_POST['lot_step'];?>">
                <span class="form__error"><?=$errors['lot_step'];?></span>
            </div>
            <div class="form__item <?=isset($errors['lot_date']) ? 'form__item--invalid' : '';?>">
                <label for="lot-date">Дата окончания торгов</label>
                <input class="form__input-date" id="lot-date" type="date" name="lot_date" value="<?=$_POST['lot_date'];?>">
                <span class="form__error"><?=$errors['lot_date'];?></span>
            </div>
        </div>
        <span class=" <?= count($errors) ?  " form--invalid" : ""; ?>"> </span>
        <button type="submit" class="button">Добавить лот</button>
    </form>
<script>
    var img_preview = document.querySelector('.img');
    var preview__remove = document.querySelector('.preview__remove');
    var preview = document.querySelector('.preview');
    function previewFile() {

        var file    = document.querySelector('input[type=file]').files[0];
        var reader  = new FileReader();
        img_preview.src = '';
        reader.onloadend = function () {
            img_preview.src = reader.result;
        }

        if (file) {
            preview.style.display = 'block';
            reader.readAsDataURL(file);
        } else {
            img_preview.src = "";
        }
    }

    preview__remove.addEventListener('click', function() {
        preview.style.display = 'none';
    })


</script>

