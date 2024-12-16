# Default Search Function

function defaultSearch() {
    dbCheck
    deCheck
    query=${tmpquery//\ /+}
    $browser $SEngine$query
}
