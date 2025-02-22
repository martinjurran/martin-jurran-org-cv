% Created by MMartin Jurran
% this is inspired by Murat Can Karacabey's Awesome CV 
\author{Martin Jurran}
\RequirePackage[dvipsnames]{xcolor} % moved here I guess article class causes option clash with xcolor if used after loading the class
\LoadClass[11pt]{article}
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{opensource_cv}[2025/02/11 opensourcecv]
\RequirePackage[sfdefault]{noto}
\RequirePackage{etoolbox}
\RequirePackage{pgffor}
\RequirePackage{titlesec}
\RequirePackage{tikz}
\RequirePackage{fontspec}
\RequirePackage[left=0.5in,top=0.1in,right=0.5in,bottom=0.1in]{geometry} % DOCUMENT MARGINS 
\RequirePackage{hyperref}
\RequirePackage{fontawesome}
\RequirePackage{mfirstuc}
\RequirePackage{ifthen}
\RequirePackage{lipsum}
\RequirePackage{array}
\RequirePackage{multicol}
\RequirePackage{eso-pic}
\pagestyle{empty}

\usepackage{comment}
\usepackage{eso-pic}

%Setup
\newcommand*{\setname}[2]{\def\@firstname{#1}\def\@lastname{#2}}
\newcommand*{\setaddress}[1]{\def\@address{#1}}
\newcommand*{\setmobile}[1]{\def\@mobile{#1}}
\newcommand*{\setposition}[1]{\def\@position{#1}}
\newcommand*{\setmail}[1]{\def\@mail{#1}}
\newcommand*{\setcitizenship}[1]{\def\@citizenship{#1}}
\newcommand*{\setthemecolor}[1]{\def\@themecolor{#1}}
\newcommand*{\setlinkedinaccount}[1]{\def\@linkedinaccount{#1}}
\newcommand*{\setwebsite}[1]{\def\@website{#1}}
\newcommand*{\setgithubaccount}[1]{\def\@githubaccount{#1}}
\newcommand*{\setcommitshort}[1]{\def\@commitshort{#1}}
\newcommand*{\setrepolink}[1]{\def\@repolink{#1}}

\hypersetup{
    colorlinks=true,
    urlcolor=VibrantLink, % URL COLOR!
}

% Header
\newcommand\headerview{
\noindent
\begin{minipage}{0.11\textwidth}%
\includegraphics[width=1.5cm]{photo.png}
\end{minipage}%
\begin{minipage}{0.82\textwidth}
\vspace{10pt}
\name \\ [0.05cm] 
\contact
\end{minipage} \\ [0.01cm]
}

\newcommand{\websiteview}{\href{\@website}{\faLink\ \footnotesize \@website}}
\newcommand{\githubview}{\href{\@linkedinaccount}{\faLinkedinSquare\ \footnotesize LinkedIn}}
\newcommand{\linkedinview}{\href{\@githubaccount}{\faGithubSquare\ \footnotesize GitHub}}

\newcommand{\name}{%
    {\LARGE \color{\@themecolor} \@firstname \ \textsc{\@lastname}}
}

\newcommand{\contact}{%
        % {\small \@address  \cps \@citizenship \\ \@mobile \cps \@mail% %%OLD
        {\small \@address \ \cpshalf \href{mailto:\@mail}{\@mail} %
        \\%
        \websiteview \cpshalf  \githubview \cpshalf \linkedinview \\ 
        } % 
}


% Helper commands
\newcommand\ruleafter[1]{#1~{\color{black!60!\@themecolor}\hrulefill}} % a trick to put the line with <before> parameter in \titleformat

%colorful pipe separator
\newcommand{\cps}{{\color{\@themecolor} \quad\textbar\quad}}
\newcommand{\cpshalf}{{\color{\@themecolor} \textbar\hspace{0.2em}}}
\newcommand{\coloredbullet}{{\color{\@themecolor} \textbullet}}

% Edit section styles
\titleformat{\section}      % Customise the \section command 
  {\large\bfseries\scshape\raggedright\color{\@themecolor}} % Make the \section headers large (\Large),
                               % small capitals (\scshape) and left aligned (\raggedright)
  {}{0em}                      % Can be used to give a prefix to all sections, like 'Section ...'
  {\ruleafter}                           % Can be used to insert code before the heading

\titlespacing*{\section}{-1pt}{-10pt}{0pt}

% Textview commands
\newcommand{\experience}[2]{%
  \mbox { \hspace{1em} \scshape \textbf{#1} }%
}

\newcommand{\datetext}[1]{%
{\itshape  \footnotesize \mdseries  \color{black} #1 } 
}

\newcommand{\datetextbold}[1]{%
{\footnotesize \mdseries  \color{black} \textbf{#1} } 
}

\newcommand{\datedexperience}[2]{%
  \begin{small} \mbox { \hspace{1em} \textbf{#1} } \end{small} \hfill \datetextbold{#2}\\[-0.1cm] %
}

\newcommand{\explanation}[2]{%
    \mbox { \hspace{1.2em} \footnotesize \emph{#1}} \hfill \datetext{#2}\\[0.02cm] %
}

\newcommand{\motivationalstatement}[1]{%
  \noindent%
  \makebox[\textwidth]{% Force the entire box to span the text width
    \hspace*{0cm}% Add left padding
      \begin{minipage}{\dimexpr\textwidth-0cm\relax}% Width accounts for 1cm padding on each side
        \footnotesize #1 \\[0.3cm]
      \end{minipage}% 
  }%
}

\newcommand{\footercontent}{%
\centering \motivationalstatement {
   \centering \color{gray} This CV is open source. Last update: Commit \@commitshort. \href{\@repolink}{See changes on GitHub.}%
  }%
}



\newcommand{\explanationdetail}[1]{%
    \indent \indent \begin{minipage}{0.87\linewidth} \footnotesize #1 \end{minipage} \\[0.1cm]
}

\newcommand{\explanationdetailskill}[1]{%
    \indent \indent \begin{minipage}{0.87\linewidth} \footnotesize #1 \end{minipage} \\[0.1cm]
}

\newcommand\createskill[2]{%
    \textbf{#1} #2
}

\newcommand\createskills[1]{%
\explanationdetail{
  \begin{tabular}{rl}
    \makeatletter
    \@for\thisitem:=#1\do{\thisitem\\[0.1cm]}
    \makeatother
    \end{tabular}
}
}
