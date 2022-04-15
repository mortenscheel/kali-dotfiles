#compdef miniserve

autoload -U is-at-least

_miniserve() {
    typeset -A opt_args
    typeset -a _arguments_options
    local ret=1

    if is-at-least 5.2; then
        _arguments_options=(-s -S -C)
    else
        _arguments_options=(-s -C)
    fi

    local context curcontext="$curcontext" state line
    _arguments "${_arguments_options[@]}" \
'--index=[The name of a directory index file to serve, like "index.html"]:index_file:_files' \
'-p+[Port to use]:PORT: ' \
'--port=[Port to use]:PORT: ' \
'*-i+[Interface to listen on]:INTERFACES: ' \
'*--interfaces=[Interface to listen on]:INTERFACES: ' \
'*-a+[Set authentication. Currently supported formats: username:password, username:sha256:hash, username:sha512:hash (e.g. joe:123, joe:sha256:a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3)]:AUTH: ' \
'*--auth=[Set authentication. Currently supported formats: username:password, username:sha256:hash, username:sha512:hash (e.g. joe:123, joe:sha256:a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3)]:AUTH: ' \
'--route-prefix=[Use a specific route prefix]:ROUTE_PREFIX: ' \
'-c+[Default color scheme]:COLOR_SCHEME:(squirrel archlinux zenburn monokai)' \
'--color-scheme=[Default color scheme]:COLOR_SCHEME:(squirrel archlinux zenburn monokai)' \
'-d+[Default color scheme]:COLOR_SCHEME_DARK:(squirrel archlinux zenburn monokai)' \
'--color-scheme-dark=[Default color scheme]:COLOR_SCHEME_DARK:(squirrel archlinux zenburn monokai)' \
'*-m+[Specify uploadable media types]:MEDIA_TYPE:(image audio video)' \
'*--media-type=[Specify uploadable media types]:MEDIA_TYPE:(image audio video)' \
'(-m --media-type)-M+[Directly specify the uploadable media type expression]:MEDIA_TYPE_RAW: ' \
'(-m --media-type)--raw-media-type=[Directly specify the uploadable media type expression]:MEDIA_TYPE_RAW: ' \
'-t+[Shown instead of host in page title and heading]:TITLE: ' \
'--title=[Shown instead of host in page title and heading]:TITLE: ' \
'*--header=[Set custom header for responses]:HEADER: ' \
'--print-completions=[Generate completion file for a shell]:shell:(bash elvish fish powershell zsh)' \
'--tls-cert=[TLS certificate to use]:TLS_CERT:_files' \
'--tls-key=[TLS private key to use]:TLS_KEY:_files' \
'-h[Print help information]' \
'--help[Print help information]' \
'-V[Print version information]' \
'--version[Print version information]' \
'-v[Be verbose, includes emitting access logs]' \
'--verbose[Be verbose, includes emitting access logs]' \
'--spa[Activate SPA (Single Page Application) mode]' \
'(--route-prefix)--random-route[Generate a random 6-hexdigit route]' \
'-P[Do not follow symbolic links]' \
'--no-symlinks[Do not follow symbolic links]' \
'-H[Show hidden files]' \
'--hidden[Show hidden files]' \
'-q[Enable QR code display]' \
'--qrcode[Enable QR code display]' \
'-u[Enable file uploading]' \
'--upload-files[Enable file uploading]' \
'-o[Enable overriding existing files during file upload]' \
'--overwrite-files[Enable overriding existing files during file upload]' \
'-r[Enable uncompressed tar archive generation]' \
'--enable-tar[Enable uncompressed tar archive generation]' \
'-g[Enable gz-compressed tar archive generation]' \
'--enable-tar-gz[Enable gz-compressed tar archive generation]' \
'-z[Enable zip archive generation]' \
'--enable-zip[Enable zip archive generation]' \
'-D[List directories first]' \
'--dirs-first[List directories first]' \
'-l[Show symlink info]' \
'--show-symlink-info[Show symlink info]' \
'-F[Hide version footer]' \
'--hide-version-footer[Hide version footer]' \
'-W[If enabled, display a wget command to recursively download the current directory]' \
'--show-wget-footer[If enabled, display a wget command to recursively download the current directory]' \
'--print-manpage[Generate man page]' \
'::PATH -- Which path to serve:_files' \
&& ret=0
}

(( $+functions[_miniserve_commands] )) ||
_miniserve_commands() {
    local commands; commands=()
    _describe -t commands 'miniserve commands' commands "$@"
}

_miniserve "$@"
