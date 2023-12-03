// Open external links in new tabs
window.addEventListener("load", function(){
    for (const a of document.body.getElementsByTagName("a")){
        if (a.href.length > 0 && new URL(a.href).origin !== location.origin){
            a.setAttribute("target", "_blank");
        }
    }
});

// Show line numbers in code blocks
// hljs.initLineNumbersOnLoad();
// Waiting to hear back from documenter: https://github.com/JuliaDocs/Documenter.jl/issues/2234