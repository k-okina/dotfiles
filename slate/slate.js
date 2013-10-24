var hamaco, hyper, mainLayout, middleGood, middleTopBar, monitor, util;

slate.configAll({
  defaultToCurrentScreen: true,
  orderScreensLeftToRight: true
});

monitor = {
  'left': 0,
  'right': 1
};

hyper = function(key) {
  return "" + key + ":ctrl,alt,shift,cmd";
};

util = {
  nextScreen: function(screen) {
    var next_screen_id;
    next_screen_id = String((screen.id() + 1) % slate.screenCount());
    return slate.screenForRef(next_screen_id);
  }
};

hamaco = {
  'fullscreen': slate.operation('corner', {
    'direction': 'top-left',
    'width': 'screenSizeX',
    'height': 'screenSizeY'
  }),
  'leftscreen': slate.operation('push', {
    'direction': 'left',
    'style': 'bar-resize:screenSizeX/2'
  }),
  'rightscreen': slate.operation('push', {
    'direction': 'right',
    'style': 'bar-resize:screenSizeX/2'
  }),
  'topleft': slate.operation('corner', {
    'direction': 'top-left',
    'width': 'screenSizeX/2',
    'height': 'screenSizeY/2'
  }),
  'topright': slate.operation('corner', {
    'direction': 'top-right',
    'width': 'screenSizeX/2',
    'height': 'screenSizeY/2'
  }),
  'bottomleft': slate.operation('corner', {
    'direction': 'bottom-left',
    'width': 'screenSizeX/2',
    'height': 'screenSizeY/2'
  }),
  'bottomright': slate.operation('corner', {
    'direction': 'bottom-right',
    'width': 'screenSizeX/2',
    'height': 'screenSizeY/2'
  }),
  'main': slate.operation('move', {
    'x': 'screenOriginX+screenSizeX/7',
    'y': 'screenOriginY+screenSizeY/10',
    'width': 'screenSizeX/7*5',
    'height': 'screenSizeY/10*8'
  })
};

slate.bind('r:ctrl,alt', slate.operation('relaunch'));

slate.bind('m:ctrl,alt', hamaco.main);

slate.bind('up:shift,cmd', hamaco.fullscreen);

slate.bind('left:shift,cmd', hamaco.leftscreen);

slate.bind('right:shift,cmd', hamaco.rightscreen);

// slate.bind('i:ctrl,alt', slate.operation('chain', {
//   'operations': [hamaco.topleft, hamaco.topright, hamaco.bottomright, hamaco.bottomleft]
// }));

// slate.bind('left:d,shift,cmd', hamaco.leftscreen.dup({
//   'style': 'bar-resize:screenSizeX/7*3'
// }));
// 
// slate.bind('right:d,shift,cmd', hamaco.rightscreen.dup({
//   'style': 'bar-resize:screenSizeX/7*3'
// }));

middleGood = slate.operation("move", {
  x: "screenOriginX+screenSizeX/7",
  y: "screenOriginY+screenSizeY/10",
  width: "screenSizeX/7*5",
  height: "screenSizeY/10*8"
});

middleTopBar = slate.operation("push", {
  direction: "right",
  style: "bar-resize:screenSizeX/2"
});

// slate.bind("o:ctrl,shift,alt,cmd", function(win) {
//   if (!win) {
//     return null;
//   }
//   return win.move(util.nextScreen(win.screen()).visibleRect());
// });
// 
// slate.bind("i:ctrl,shift,alt,cmd", slate.operation("focus", {
//   direction: "behind"
// }));
// 
// slate.bind("f6", function(win) {
//   if (win.app().name() === "iTunes") {
//     return slate.operation("hide", {
//       app: 'current'
//     }).run();
//   } else {
//     return slate.shell("/usr/bin/open -a iTunes", false);
//   }
// });
// 
// slate.bind('e:cmd', slate.operation("shell", {
//   command: '/usr/bin/open -a Finder',
//   wait: false
// }));

if (slate.screenCount() === 1) {
  mainLayout = slate.layout("main", {
    MacVim: {
      operations: [hamaco.topleft],
      repeat: true
    },
    '夜フクロウ': {
      operations: [
        hamaco.leftscreen.dup({
          style: 'bar-resize:screenSizeX/7*2'
        })
      ]
    },
    Firefox: {
      operations: [
        hamaco.rightscreen.dup({
          style: 'bar-resize:screenSizeX/7*5'
        })
      ]
    },
    OmniFocus: {
      operations: [middleGood],
      "main-first": true
    },
    'Google Chrome': {
      operations: [hamaco.fullscreen]
    }
  });
} else {
  mainLayout = slate.layout("main", {
    MacVim: {
      operations: [
        hamaco.rightscreen.dup({
          screen: monitor.right
        })
      ],
      repeat: true
    },
    '夜フクロウ': {
      operations: [
        hamaco.rightscreen.dup({
          screen: monitor.left,
          style: 'bar-resize:screenSizeX/3*2'
        })
      ]
    },
    Firefox: {
      operations: [
        middleGood.dup({
          screen: monitor.right
        })
      ]
    },
    OmniFocus: {
      operations: [
        middleGood.dup({
          screen: monitor.right
        })
      ],
      "main-first": true
    },
    'Google Chrome': {
      operations: [
        hamaco.fullscreen.dup({
          screen: monitor.right
        }), hamaco.fullscreen.dup({
          screen: monitor.left
        })
      ],
      "main-first": true,
      repeat: true
    }
  });
}

// slate.bind("1:ctrl,shift,alt,cmd", slate.operation("layout", {
//   name: mainLayout
// }));
