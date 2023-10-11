module.exports = {
    theme: 'reco',
    title: "Nan's blog",
    description: "Welcome to Nan's blog",
    // 移动端优化
    head: [
        ['link', { rel: 'icon', href: '/favicon.ico' } ],
        ['meta', { name: 'viewport', content: 'width=device-width,initial-scale=1,user-scalable=no' } ],
        ['meta', { name: 'robots', content: 'all'} ],
        ['meta', { name: 'keywords', content: 'css,html,es6,js,vue,react,前端,blog,vuepress-blog' } ],
    ],
    // 主题设置
    themeConfig: {
        type: 'blog',
        author: 'nan_kliang',
        // 显示在个人信息的头像
        authorAvatar: '/avatar.png',
        // 导航栏左侧logo
        logo: '/avatar.png',
        // 搜索设置
        search: true,
        searchMaxSuggestions: 10,
        // 自动形成侧边导航及其深度
        subSidebar: 'auto',
        sidebarDepth: 1,
        // 最后更新时间
        lastUpdated: 'Last Updated',
        // 项目开始时间
        startYear: '2021',
        // 导航栏配置
        nav: [
            { text: '主页', link: '/', icon: 'reco-home' },
            { text: '时间轴', link: '/timeline/', icon: 'reco-date' },
            { text: '关于', link: '/about/', icon: 'reco-account'},
            { text: 'GitHub', link: 'https://github.com/nankailiang/', icon: 'reco-github' }
        ],
        // 博客配置
        blogConfig: {
            category: {
                location: 2, // 在导航栏菜单中所占的位置，默认2
                text: '分类' // 默认 “分类”
            },
            tag: {
                location: 3, // 在导航栏菜单中所占的位置，默认3
                text: '标签' // 默认 “标签”
            }
        },
    },
    search: true,
    searchMaxSuggestions: 10,
    // 自动形成侧边导航
    subSidebar: 'auto',
    sidebarDepth: 1,
    displayAllHeaders: false,
    // 插件配置
    plugins: [
        [
            'permalink-pinyin',
            {
                lowercase: true,
                separator: '-'
            }
        ]
    ]
}