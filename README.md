# WordPress Event Calendar in Swift
Swift integration of [The Events Calender](https://theeventscalendar.com) plugin for [WordPress](https://wordpress.org).

## How to use

All you have to do is change the URL in the `ViewController`. Insert your own URL here.

```
guard let url = URL(string: "https://YOUR-URL.com/wp-json/tribe/events/v1/events/?per_page=100")else{return}
```

## Modification
### Number of posts

If you want to change the number of events displayed, simply change the number in the URL at `per_page`.

## License

MIT License

For more information, please see the `LICENSE` file.
