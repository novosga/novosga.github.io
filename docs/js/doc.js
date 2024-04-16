window.$docsify = {
  alias: {
    '/.*/_navbar.md': '/_navbar.md',
    // "/(\w{2})/v(\d)[.](\d+)/(.*)": "$1/$2.$3/$4",
    "/v([0-9]+).([0-9]+)/(.*)": "/$1.$2/$3",
  },
  fallbackLanguages: ["pt", "en"],
  name: 'Novo SGA',
  logo: 'images/logo.png',
  repo: 'novosga/novosga.github.io',
  auto2top: true,
  loadSidebar: true,
  loadNavbar: true,
  mergeNavbar: true,
  maxLevel: 4,
  subMaxLevel: 2,
  search: {
    noData: {
      '/': 'Nenhum resultado'
    },
    paths: 'auto',
    placeholder: {
      '/': 'Busca'
    }
  },
  formatUpdated: '{MM}/{DD} {HH}:{mm}',
  plugins: [
    function (hook, vm) {
      hook.mounted(function () {
        // Docsify.dom.find('#version-selector', function (e) {
        //   window.location.hash = e.target.value
        // })
      })
    },
    function (hook, vm) {
      hook.beforeEach(function (html) {
        var url = 'https://github.com/novosga/novosga.github.io/blob/master/doc/' + vm.route.file
        var editHtml = '[:memo: Edit Document](' + url + ')\n'

        return html
          + '\n----\n'
          + 'Last modified {docsify-updated} '
          + editHtml
      })
    },
  ]
}
