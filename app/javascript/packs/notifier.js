export function notefy(title, content) {
    let notifier = $("#notifier");
    let n_title = $("#notifier-title");
    let n_content = $("#notifier-content");
    // adding content
    n_title.html(title);
    n_content.html(content);
    // animation
    if (notifier.is(":hidden")) {
        notifier.fadeIn(1000, function() {
            setTimeout(function() {
                notifier.fadeOut(1000).promise()
                .then(() => {
                    n_title.html("");
                    n_content.html("");
                });
            }, 3000)});
    }
}