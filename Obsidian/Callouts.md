[Официальная документация по Callouts](https://help.obsidian.md/callouts)

### Поддерживаемые типы

> [!note]
> Lorem ipsum dolor sit amet

> [!abstract]
> Lorem ipsum dolor sit amet

> [!info]
> Lorem ipsum dolor sit amet

> [!todo]
> Lorem ipsum dolor sit amet

> [!tip]
> Lorem ipsum dolor sit amet

> [!success]
> Lorem ipsum dolor sit amet

> [!question]
> Lorem ipsum dolor sit amet

> [!warning]
> Lorem ipsum dolor sit amet

> [!failure]
> Lorem ipsum dolor sit amet

> [!danger]
> Lorem ipsum dolor sit amet

> [!bug]
> Lorem ipsum dolor sit amet

> [!example]
> Lorem ipsum dolor sit amet

> [!quote]
> Lorem ipsum dolor sit amet

### Кастомные типы

Переходим во `Фрагменты CSS кода` (`Настройки -> Оформление -> Фрагменты CCS кода`) и там создаем там свой стиль, например, `custom-callouts.css` со следующим содержанием:

```css
.callout[data-callout="bookmark"] {
    --callout-color: 162, 162, 50;
    --callout-icon: lucide-bookmark;
}
```

Значением атрибута `data-callout` является идентификатор типа, который вы хотите использовать, например `[!bookmark]`.

`--callout-color` определяет цвет фона в формате [RGB](https://www.rapidtables.com/web/color/RGB_Color.html).

`--callout-icon` может быть идентификатором значка из [lucide.dev](https://lucide.dev/) или элементом SVG. 

### Примеры

> [!question] С вложением
> > [!todo] Вложение
> > > [!example]  Еще одно вложение
> > 

> [!bookmark]
> Lorem ipsum dolor sit amet

> [!note]+ Развернутый по умолчанию
> Lorem ipsum dolor sit amet

> [!note]- Свернутый по умолчанию
> Lorem ipsum dolor sit amet

