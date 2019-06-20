<form class="form container <?=count($errors) ? 'form--invalid' : '';?>" action="sign-up.php" method="post" enctype="multipart/form-data"> <!-- form--invalid -->
    <h2>Регистрация нового аккаунта</h2>
    <div class="form__item <?=isset($errors['email']) ? 'form__item--invalid' : '';?>"> <!-- form__item--invalid -->
        <label for="email">E-mail*</label>
        <input id="email" type="text" name="email" placeholder="Введите e-mail" value="<?=$_POST['email'];?>">
        <span class="form__error"><?= isset($errors['email']) ? $errors['email'] : '';?></span>
    </div>
    <div class="form__item <?=isset($errors['password']) ? 'form__item--invalid' : '';?>">
        <label for="password">Пароль*</label>
        <input id="password" type="text" name="password" placeholder="Введите пароль" value="<?=$_POST['password'];?>">
        <span class="form__error"><?= isset($errors['password']) ? $errors['password'] : '';?></span>
    </div>
    <div class="form__item <?=isset($errors['name']) ? 'form__item--invalid' : '';?>">
        <label for="name">Имя*</label>
        <input id="name" type="text" name="name" placeholder="Введите имя" value="<?=$_POST['name'];?>">
        <span class="form__error"><?= isset($errors['name']) ? $errors['name'] : '';?></span>
    </div>
    <div class="form__item <?=isset($errors['message']) ? 'form__item--invalid' : '';?>">
        <label for="message">Контактные данные*</label>
        <textarea id="message" name="message" placeholder="Напишите как с вами связаться" ><?=$_POST['message'];?></textarea>
        <span class="form__error"><?= isset($errors['message']) ? $errors['message'] : '';?></span>
    </div>
    <div class="form__item form__item--file form__item--last <?=isset($errors['avatar']) ? 'form__item--invalid' : '';?>">
        <label>Аватар</label>
        <div class="preview">
            <button class="preview__remove" type="button">x</button>
            <div class="preview__img">
                <img src="img/avatar.jpg" class="img" width="113" height="113" alt="Ваш аватар">
            </div>
        </div>
        <div class="form__input-file <?=isset($errors['message']) ? 'form__item--invalid' : '';?>" >
            <input class="visually-hidden" type="file" name="avatar" id="photo2" value="" onchange="previewFile()">
            <label for="photo2">
                <span>+ Добавить</span>
            </label>
        </div>
        <span class="form__error <?=isset($errors['avatar']) ? ' form--invalid' : '';?>"><?=isset($errors['avatar']) ? $errors['avatar'] : '';?></span>
    </div>
    <span class=" <?= isset($errors) ?  " form--invalid" : ""; ?>"> </span>
    <button type="submit" class="button">Зарегистрироваться</button>
    <a class="text-link" href="login.php">Уже есть аккаунт</a>
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
            console.log("sdfg");
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