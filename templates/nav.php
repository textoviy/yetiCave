<nav class="nav">
    <ul class="nav__list container">
        <?php foreach (array_values($categories) as $key): ?>
            <li class="nav__item">
                <a href="all-lots.html"><?=$key; ?></a>
            </li>
        <?php endforeach; ?>
    </ul>
</nav>

