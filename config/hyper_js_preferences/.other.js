module.exports = {
//////////////////////////////////////
// 基本設定
//////////////////////////////////////
  config: {
    // 安定バージョンの更新を受け取る
    updateChannel: 'stable',
    // フォントサイズ
    fontSize: 10,
    // フォントファミリー
    fontFamily: 'Menlo, "DejaVu Sans Mono", Consolas, "Lucida Console", monospace',
    // フォントの太さ
    fontWeight: 'normal',
    // 太字フォントの太さ
    fontWeightBold: 'bold',
    // 行の高さ
    lineHeight: 1,
    // 文字の間隔
    letterSpacing: 0,
    // ターミナルカーソルの背景色と不透明度
    cursorColor: 'rgba(248,28,229,0.8)',
    // ターミナルカーソル下の文字の色
    cursorAccentColor: '#000',
    // ターミナルカーソルの種類
    cursorShape: 'BLOCK',
    // ターミナルカーソルの点滅
    cursorBlink: false,
    // ターミナルのメインテキストの色
    foregroundColor: '#fff',
    // ターミナルの背景色
    backgroundColor: '#000',
    // ターミナルでのテキスト選択の背景色/不透明度
    selectionColor: 'rgba(248,28,229,0.3)',
    // メインウィンドウの境界線とタブバーの色 
    borderColor: '#333',
    // カスタムCSS 
    css: '',
    termCSS: '',
    // スタート時の作業ディレクトリ
    workingDirectory: '',
    // ハンバーガメニュー
    showHamburgerMenu: '',
    // ボタン系の表示
    showWindowControls: '',
    // 余白
    padding: '12px 14px',
    // カラーマッピング
    colors: {
      black: '#000000',
      red: '#C51E14',
      green: '#1DC121',
      yellow: '#C7C329',
      blue: '#0A2FC4',
      magenta: '#C839C5',
      cyan: '#20C5C6',
      white: '#C7C7C7',
      lightBlack: '#686868',
      lightRed: '#FD6F6B',
      lightGreen: '#67F86F',
      lightYellow: '#FFFA72',
      lightBlue: '#6A76FB',
      lightMagenta: '#FD7CFC',
      lightCyan: '#68FDFE',
      lightWhite: '#FFFFFF',
      limeGreen: '#32CD32',
      lightCoral: '#F08080',
    },
    // デフォルトシェル
    shell: '',
    // シェル起動時の引数
    shellArgs: ['--login'],
    // 環境変数
    env: {},
    // 通知音
    bell: 'false',
    // 選択時に自動コピー
    copyOnSelect: false,
    // デフォルトSSHアプリ
    defaultSSHApp: true,
    // 右クリックで選択したテキストコピー、または貼り付け
    quickEdit: false,
    // 選択中にOptionキー押下で列モード
    macOptionSelectionMode: 'vertical',
    // WebGLレンダラー
    webGLRenderer: true,
    // 一部の特殊文字を無視
    disableLigatures: false,
  },

//////////////////////////////////////
// プラグイン一覧
//////////////////////////////////////
  plugins: [
    "hyper-material-theme",
    "hyper-tab-icons-plus",
    "hyperterm-summon",
    "hyper-pane",
    "hyper-broadcast",
    "hypercwd"
  ],

  // ローカルプラグイン
  localPlugins: [],

//////////////////////////////////////
// キーマップ
//////////////////////////////////////
  keymaps: {
  },


//////////////////////////////////////
// hyper-pane
//////////////////////////////////////
  paneNavigation: {
    debug: false,
    hotkeys: {
      navigation: {
        up: 'ctrl+alt+up',
        down: 'ctrl+alt+down',
        left: 'ctrl+alt+left',
        right: 'ctrl+alt+right'
      },
      jump_prefix: 'ctrl+alt',
      permutation_modifier: 'shift',
      maximize: 'meta+enter'
    },
    showIndicators: true,
    indicatorPrefix: '^⌥',
    indicatorStyle: {
      position: 'absolute',
      top: 0,
      left: 0,
      fontSize: '10px'
    },
    focusOnMouseHover: true,
    inactivePaneOpacity: 0.7
  },

//////////////////////////////////////
// hyper-material-theme
//////////////////////////////////////
  MaterialTheme: { 
     theme: 'Palenightr',
     backgroundOpacity: '0.7',
     accentColor: '#64FFDA',
     vibrancy: 'dark'
  },
};
