#!/usr/bin/env julia

using Documenter

makedocs(
    sitename="CIT 144: Python I",
    authors="Mariah A. Knowles <mariah.knowles@kctcs.edu> and contributors",
    format=Documenter.HTML(assets=[
        asset("https://cdn.jsdelivr.net/npm/highlightjs-line-numbers.js/dist/highlightjs-line-numbers.min.js"),
        "assets/script.js"
    ]),
    pages = [
        "Home" => "index.md",
        "Unit 1 - Introduction" => [
            "Week 1" => [
                "journal01.md"
            ],
            "Week 2" => [
                "journal02.md",
                "lab1.md",
                "checkin1.md"
            ],
            "Week 3" => [
                "journal03.md",
                "studio1.md"
            ]
        ],
        "Unit 2 - Fundamental Skills" => [
            "Week 4" => [
                "journal04.md"
            ],
            "Week 5" => [
                "journal05.md",
                "lab2.md",
                "checkin2.md"
            ],
            "Week 6" => [
                "journal06.md"
            ],
            "Week 7" => [
                "journal07.md",
                "lab3.md",
                "checkin3.md"
            ]
        ],
        "Unit 3 - Continuing to Build Skills" => [
            "Week 8" => [
                "journal08.md",
                "studio2.md"
            ],
            "Break" => "break.md",
            "Week 9" => [
                "journal09.md"
            ],
            "Week 10" => [
                "journal10.md",
                "lab4.md",
                "checkin4.md"
            ]
        ],
        "Unit 4 - Like a Final Draft" => [
            "Week 11" => [
                "journal11.md"
            ],
            "Week 12" => [
                "journal12.md",
                "lab5.md",
                "checkin5.md"
            ],
            "Week 13" => [
                "journal13.md",
                "peerreview.md"
            ]
        ],
        "Unit 5 - Wrap Up!" => [
            "Week 14" => [
                "journal14.md",
                "studio3.md"
            ],
            "Week 15" => [
                "journal15.md",
                "project.md"
            ],
            "Finals" => [
                "tutorial.md"
            ]
        ]
    ]
)

mv("build", "latest", force=true)


