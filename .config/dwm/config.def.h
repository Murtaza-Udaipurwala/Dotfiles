/*------------------------appearance----------------------------------------*/

static const unsigned int borderpx  = 3;        /* border pixel of windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const int swallowfloating    = 0;        /* 1 means swallow floating windows by default */
static const unsigned int gappih    = 10;       /* horiz inner gap between windows */
static const unsigned int gappiv    = 10;       /* vert inner gap between windows */
static const unsigned int gappoh    = 10;       /* horiz outer gap between windows and screen edge */
static const unsigned int gappov    = 10;       /* vert outer gap between windows and screen edge */
static       int smartgaps          = 1;        /* 1 means no outer gap when there is only one window */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
static const int horizpadbar        = 6;        /* horizontal padding for statusbar */
static const int vertpadbar         = 8;        /* vertical padding for statusbar */
static const char *fonts[]          = {
    "Terminus:antialias=true:autohint=true",
    "FiraCode Nerd Font:size=15:antialias=true:autohint=true",
	"NotoColorEmoji:size=15.5:antialias=true:autohint=true"
};

static const char dmenufont[]       = "FiraCode Nerd Font:size=11";
static const char col_gray1[]       = "#000";
static const char col_gray2[]       = "#fff";
static const char col_gray3[]       = "#88C0D0";
static const char col_gray4[]       = "#c5c6d0";
static const char col_cyan[]        = "#88C0D0";
static const char *colors[][3]      = {
	/*               fg         bg         border   */
	[SchemeNorm] = { col_gray2, col_gray1, col_gray1},
	[SchemeSel]  = { col_gray1, col_gray3, col_cyan },
};



/*-----------------------------tagging--------------------------------------*/

static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7", "8", "9" };

static const Rule rules[] = {
	/* class            instance  title           tags mask  isfloating  isterminal  noswallow  monitor  scratch key */
	{ "firefox",  	    NULL,     NULL,           1 << 1,    0,          0,          -1,        -1,      0     },
	{ "st",             NULL,     NULL,           0,         0,          1,           1,        -1,      0     },
	{ "Gcolor3",        NULL,     NULL,           0,         1,          0,           1,        -1,      0     },
	{ NULL,             NULL,     "Event Tester", 0,         0,          0,           1,        -1,      0     }, /* xev */
	{ NULL,             NULL,     "scratchpad",   0,         1,          0,           0,        -1,      's'   },
	{ NULL,             NULL,     "bc",           0,         1,          0,           0,        -1,      'c'   },
};



/*-----------------------------layouts------------------------------------*/

static const float mfact     = 0.5;  /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 0;    /* 1 means respect size hints in tiled resizals */

#define FORCE_VSPLIT 1  /* nrowgrid layout: force two clients to always split vertically */
#include "vanitygaps.c"

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]=",      tile },    /* first entry is default */
	{ "TTT",      bstack },
	{ "===",      bstackhoriz },
	{ "[@]",      spiral },
	{ "[\\]",     dwindle },
	{ "|M|",      centeredmaster },
	{ ">M>",      centeredfloatingmaster },
	{ "HHH",      grid },
	{ "H[]",      deck },
	{ "[M]",      monocle },
	{ "><>",      NULL },    /* no layout function means floating behavior */
	{ NULL,       NULL },

    /* redundant layouts */
	{ "###",      nrowgrid },
	{ "---",      horizgrid },
	{ ":::",      gaplessgrid },
};



/*-----------------------key definitions------------------------------------*/

#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = { "dmenu_run", NULL };
static const char *termcmd[]  = { "st", NULL };

/*First arg only serves to match against key in rules*/
static const char *scratchpadcmd[] = {"s", "st", "-t", "scratchpad", NULL};
static const char *bccmd[] = {"c", "st", "-t", "bc", "-e", "bc", "-ql", NULL};

static Key keys[] = {
	/* modifier                     key        function        argument */

	/*------scratchpads---------*/
	{ MODKEY,                       XK_grave,  togglescratch,  {.v = scratchpadcmd } },
	{ MODKEY,                       XK_c,      togglescratch,  {.v = bccmd } },

	{ MODKEY,						XK_x,      killclient,     {0} },

	{ MODKEY,                       XK_b,      togglebar,      {0} },

	{ MODKEY|ShiftMask,             XK_j,      rotatestack,    {.i = +1 } },

	{ MODKEY|ShiftMask,             XK_k,      rotatestack,    {.i = -1 } },

	{ MODKEY,                       XK_j,      focusstack,     {.i = +1 } },

	{ MODKEY,                       XK_k,      focusstack,     {.i = -1 } },

	{ MODKEY,                       XK_i,      incnmaster,     {.i = +1 } },

	{ MODKEY,                       XK_d,      incnmaster,     {.i = -1 } },

	{ MODKEY,                       XK_h,      setmfact,       {.f = -0.05} },

	{ MODKEY,                       XK_l,      setmfact,       {.f = +0.05} },

	{ MODKEY,                       XK_space,  zoom,           {0} },

	{ MODKEY,                       XK_0,      view,           {.ui = ~0 } },

	{ MODKEY|ShiftMask,             XK_0,      tag,            {.ui = ~0 } },

	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	TAGKEYS(                        XK_5,                      4)
	TAGKEYS(                        XK_6,                      5)
	TAGKEYS(                        XK_7,                      6)
	TAGKEYS(                        XK_8,                      7)
	TAGKEYS(                        XK_9,                      8)

	{ MODKEY|ShiftMask,             XK_q,      quit,           {0} }, /* quits dwm */

	{ MODKEY,						XK_q,      quit,           {1} }, /* restarts dwm */


	/*----------Layout bindings-------------*/
	{ MODKEY,						XK_Tab,	   cyclelayout,    {.i = +1 } },
	{ MODKEY|ShiftMask,				XK_Tab,    cyclelayout,    {.i = -1 } },

	{ MODKEY|ShiftMask,			    XK_f,      togglefullscr,  {0} }, /* fullscreen */
	{ MODKEY,                       XK_t,      setlayout,      {.v = &layouts[10]} }, /* floating layout */

	{ MODKEY|ControlMask,           XK_t,      setlayout,      {.v = &layouts[0]} }, /* tile layout */
	{ MODKEY|ControlMask,           XK_b,      setlayout,      {.v = &layouts[1]} }, /* bstack layout */
	{ MODKEY|ControlMask,           XK_s,      setlayout,      {.v = &layouts[3]} }, /* spiral layout */
	{ MODKEY|ControlMask,           XK_d,      setlayout,      {.v = &layouts[4]} }, /* dwindle layout */
	{ MODKEY|ControlMask,           XK_m,      setlayout,      {.v = &layouts[5]} }, /* centeredmaster layout */
	{ MODKEY|ControlMask,           XK_c,      setlayout,      {.v = &layouts[6]} }, /* centeredfloatingmaster layout */
	{ MODKEY|ControlMask,           XK_g,      setlayout,      {.v = &layouts[7]} }, /* grid layout */

	/*----------gaps-------------*/
	{ MODKEY|ShiftMask,             XK_equal,  incrgaps,       {.i = +1 } },
	{ MODKEY,                       XK_minus,  incrgaps,       {.i = -1 } },
	{ MODKEY,                       XK_equal,  defaultgaps,    {0} },
	{ MODKEY|ShiftMask,             XK_minus,  togglegaps,     {0} },
	/* { MODKEY|Mod1Mask,              XK_i,      incrigaps,      {.i = +1 } }, */
	/* { MODKEY|Mod1Mask|ShiftMask,    XK_i,      incrigaps,      {.i = -1 } }, */
	/* { MODKEY|Mod1Mask,              XK_o,      incrogaps,      {.i = +1 } }, */
	/* { MODKEY|Mod1Mask|ShiftMask,    XK_o,      incrogaps,      {.i = -1 } }, */
	/* { MODKEY|Mod1Mask,              XK_6,      incrihgaps,     {.i = +1 } }, */
	/* { MODKEY|Mod1Mask|ShiftMask,    XK_6,      incrihgaps,     {.i = -1 } }, */
	/* { MODKEY|Mod1Mask,              XK_7,      incrivgaps,     {.i = +1 } }, */
	/* { MODKEY|Mod1Mask|ShiftMask,    XK_7,      incrivgaps,     {.i = -1 } }, */
	/* { MODKEY|Mod1Mask,              XK_8,      incrohgaps,     {.i = +1 } }, */
	/* { MODKEY|Mod1Mask|ShiftMask,    XK_8,      incrohgaps,     {.i = -1 } }, */
	/* { MODKEY|Mod1Mask,              XK_9,      incrovgaps,     {.i = +1 } }, */
	/* { MODKEY|Mod1Mask|ShiftMask,    XK_9,      incrovgaps,     {.i = -1 } }, */

	/* keybindings for Multi-monitor system */
	/* { MODKEY,                       XK_comma,  focusmon,       {.i = -1 } }, */
	/* { MODKEY,                       XK_period, focusmon,       {.i = +1 } }, */
	/* { MODKEY|ShiftMask,             XK_comma,  tagmon,         {.i = -1 } }, */
	/* { MODKEY|ShiftMask,             XK_period, tagmon,         {.i = +1 } }, */
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};


/* Note */
/* super + shift + 0                       focused window appear on all tags */
/* super + control <tag no.>               view all windows on tag <tag no.> and current tag simultaneously */
/* super + 0							   view all windows */
