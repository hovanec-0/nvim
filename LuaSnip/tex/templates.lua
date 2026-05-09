local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

local in_mathzone = function()
    return vim.fin['vimtex#syntax#in_mathzone']() == 1
end

ls.add_snippets("tex", {
    s({trig = "eq", dscr="equation environment"}, 
        fmta(
            [[
                \begin{equation*}
                    <>
                \end{equation*}
            ]],
            {i(1)}
        )
    ),

    s({trig = "eqn", dscr="equation environment w/ number"}, 
        fmta(
            [[
                \begin{equation}
                    <>
                \end{equation}
            ]],
            {i(1)}
        )
    ),

    s({trig = "al", dscr="align environment"}, 
        fmta(
            [[
                \begin{align*}
                    <>
                \end{align*}
            ]],
            {i(1)}
        )
    ),

    s({trig = "aln", dscr="align environment w/ number"}, 
        fmta(
            [[
                \begin{align}
                    <>
                \end{align}
            ]],
            {i(1)}
        )
    ),
    s({trig = "dcmop", dscr="declare math operator", snippetType="autosnippet"}, 
        fmta(
            [[
                \DeclareMathOperator{\<>}{<>}
            ]],
            {i(1), i(2)}
        )
    ),
    s({trig = "pppp", dscr="problem proof", snippetType = "autosnippet"}, 
        fmta(
            [[
                \begin{problem}
                    <>
                \end{problem}
                \begin{proof}
                    <>
                \end{proof}
            ]],
            {i(1), i(2)}
        ),
        {condition = line_begin}
    ),
    s({trig = "dmppp", dscr="Dummit and Foote problem proof", snippetType = "autosnippet"}, 
        fmta(
            [[
                \begin{problem}
                [Dummit and Foote <>]
                \end{problem}
                \begin{proof}
                    <>
                \end{proof}
            ]],
            {i(1), i(2)}
        ),
        {condition = line_begin}
    ),
    s({trig = "mhppp", dscr="Marsden and Hoffman problem proof", snippetType = "autosnippet"}, 
        fmta(
            [[
                \begin{problem}
                [Marsden and Hoffman <>]
                \end{problem}
                \begin{proof}
                    <>
                \end{proof}
            ]],
            {i(1), i(2)}
        ),
        {condition = line_begin}
    ),
    s({trig = "mmppp", dscr="Munkres problem proof", snippetType = "autosnippet"}, 
        fmta(
            [[
                \begin{problem}
                [Munkres Chapter <> Problem <>]
                \end{problem}
                \begin{proof}
                    <>
                \end{proof}
            ]],
            {i(1), i(2), i(3)}
        ),
        {condition = line_begin}
    ),
    s({trig = "cfgig", dscr="insert centered figure", snippetType = "autosnippet"}, 
        fmta(
            [[
               \begin{minipage}{\linewidth}% to keep image and caption on one page
                \makebox[\linewidth]{%        to center the image
                \includegraphics[keepaspectratio=true,scale=0.6]{<>}}
                \captionof{figure}{<>}
                \end{minipage}
                \vspace{5mm}               
                ]],
            {i(1), i(2)}
        ),
        {condition = line_begin}
    ),
    -- Math operator kits
    s({trig = "LAtempl", dscr="linear algebra math operators", snippetType = "autosnippet"}, 
        fmta(
            [[
                \DeclareMathOperator{\rank}{rank}
                \DeclareMathOperator{\im}{im}
                \DeclareMathOperator{\tr}{tr}
                \DeclareMathOperator{\nul}{null}
                \DeclareMathOperator{\Span}{span}
                <>
            ]],
            {i(0)}
        ),
        {condition = line_begin}
    ),
    s({trig = "Algtempl", dscr="algebra math operators", snippetType = "autosnippet"}, 
        fmta(
            [[
                \DeclareMathOperator{\Inn}{Inn}
                \DeclareMathOperator{\Aut}{Aut}
                \DeclareMathOperator{\Out}{Out}
                \DeclareMathOperator{\im}{Im}
                \DeclareMathOperator{\ins}{ins}
                <>
            ]],
            {i(0)}
        ),
        {condition = line_begin}
    ),
    s({trig = "complextempl", dscr="algebra math operators", snippetType = "autosnippet"}, 
        fmta(
            [[
                \DeclareMathOperator{\res}{res}
                \DeclareMathOperator{\re}{Re}
                \DeclareMathOperator{\im}{Im}
                <>
            ]],
            {i(0)}
        ),
        {condition = line_begin}
    ),


    s({trig = "templ", dscr="homework template", snippetType="autosnippet"}, 
        fmta(
            [[
                \documentclass[a4paper,12pt,reqno]{amsart}
                \usepackage{geometry}

                \geometry{letterpaper, margin=1in}

                \newcommand{\classtitle}{<>}
                \newcommand{\doctitle}{<>}
                \newcommand{\username}{Julian Hovanec}

                \usepackage{fancyhdr}
                \usepackage{amsmath}
                \usepackage{amssymb}
                \usepackage{mathrsfs}
                \usepackage{tikz-cd}
                \usepackage{graphicx}
                \graphicspath{ {./images/} }
                \usepackage{caption}



                \pagestyle{fancy}
                \fancyhead{}
                \lhead{\doctitle}
                \rhead{\username}

                \setlength{\headheight}{14.0pt}
                \setlength{\footskip}{14.0pt}


                \theoremstyle{definition}
                \newtheorem{theorem}{Theorem}[section]
                \newtheorem{problem}{Problem}
                \newtheorem{lemma}{Lemma}
                \newtheorem{prop}{Proposition}
                \newtheorem{defn}{Definition}

                \title{\classtitle\;\doctitle}
                \author{\username}

                %User Defined Commands
                %User Defined Commands
                \DeclareMathOperator{\ord}{ord}
                \DeclareMathOperator{\Aut}{Aut}
                \DeclareMathOperator{\Gal}{Gal}
                \DeclareMathOperator{\Sym}{Sym}
                \DeclareMathOperator{\Free}{Free}
                \DeclareMathOperator{\ins}{ins}
                \DeclareMathOperator{\Hom}{Hom}
                \DeclareMathOperator{\mult}{mult}
                \DeclareMathOperator{\ev}{ev}
                \DeclareMathOperator{\act}{act}
                \DeclareMathOperator{\Spec}{Spec}
                \DeclareMathOperator{\End}{End}
                \DeclareMathOperator{\Maps}{Maps}
                \DeclareMathOperator{\dom}{dom}
                \DeclareMathOperator{\len}{len}
                \DeclareMathOperator{\im}{im}
                \DeclareMathOperator{\id}{id}



                \begin{document}
                    \maketitle
                    \begin{problem}
                        <>
                    \end{problem}
                \end{document}
            ]],
            {i(1), i(2), i(3)}
        ),
        {condition = line_begin}
    ),
})

