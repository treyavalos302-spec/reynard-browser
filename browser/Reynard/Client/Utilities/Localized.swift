import Foundation

struct Localized {
    // MARK: - 设置页面
    static let settings = "设置"
    static let search = "搜索"
    static let appearance = "外观"
    static let browsing = "浏览"
    static let addons = "扩展"
    static let privacy = "隐私"
    static let about = "关于"
    static let general = "通用"
    static let updates = "更新"
    static let jit = "JIT"

    // MARK: - 搜索设置
    static let searchEngine = "搜索引擎"
    static let customSearchURL = "自定义搜索 URL"
    static let invalidSearchURL = "无效的搜索 URL"
    static let enterSearchURL = "输入带有 %s 的搜索 URL"

    // MARK: - 外观设置
    static let addressBarPosition = "地址栏位置"
    static let top = "顶部"
    static let bottom = "底部"
    static let landscapeTabBar = "横屏标签栏"

    // MARK: - 浏览设置
    static let requestDesktopSite = "请求桌面版网站"
    static let allWebsites = "所有网站"

    // MARK: - 隐私设置
    static let sitePermissions = "网站权限"
    static let noSitesAdded = "未添加网站"
    static let openSettings = "打开设置"
    static let resetAllPermissions = "重置所有权限"

    // MARK: - 关于页面
    static let appVersion = "应用版本"
    static let engineVersion = "引擎版本"
    static let viewSourceCode = "查看源代码"
    static let supportProject = "支持本项目"
    static let reynardBrowser = "Reynard 浏览器"
    static let githubProfile = "GitHub 个人资料"

    // MARK: - 通用操作
    static let cancel = "取消"
    static let ok = "确定"
    static let loading = "加载中..."

    // MARK: - 扩展管理
    static let noAddonsInstalled = "未安装扩展"
    static let discoverAddons = "发现扩展..."
    static let installFromFile = "从文件安装扩展..."
    static let successfullyResetPermissions = "成功重置所有网站权限。"

    // MARK: - 无痕浏览
    static let privateBrowsing = "无痕浏览"
    static let privateBrowsingDesc = "Reynard 不会记录您的浏览历史或 Cookie。但下载和新书签仍会被保存。"
    static let tabs = "标签页"

    // MARK: - 扩展错误
    static let thisExtension = "此扩展"
    static let errorUserCanceled = "用户已取消"
    static let errorAborted = "已中止"
    static let failedToUpdateExtension = "未能更新扩展。"
    static let blocked = "已阻止"
    static let restricted = "受限"
    static let networkError = "网络错误"
    static let connectionFailure = "由于连接失败，无法下载此扩展。"
    static let corruptFile = "文件损坏"
    static let fileCorrupt = "此扩展无法安装，因为它似乎已损坏。"
    static let notVerified = "未验证"
    static let notVerifiedMessage = "此扩展无法安装，因为它尚未经过验证。"
    static let incompatible = "不兼容"
    static let adminOnly = "仅限管理员"
    static let error = "错误"
    static let updateFailed = "更新失败"
    static let failedToInstallThisExtension = "未能安装此扩展。"
    static let needsPermissionToUpdate = "需要权限才能更新"
    static let oneAddonNeedsPermissionToUpdate = "1 个扩展需要权限才能更新。"
    static let updatingAddons = "正在更新扩展..."
    static let completeAddonUpdates = "完成扩展更新"
    static let noAddonsInstalledMessage = "未安装任何扩展"
    static let loadingAddons = "正在加载扩展..."
    static let unsupported = "不支持"
    static let discoverAddonsMessage = "发现扩展..."
    static let installAddonFromFile = "从文件安装扩展..."
    static let installingAddon = "正在安装扩展..."
    static let makeSureTrollStoreEnabled = "请确保 TrollStore 的 URL Scheme 已启用。"

    // MARK: - 扩展错误（带参数）
    static let addonViolatesPolicies = "%@ 违反了 Mozilla 的政策，无法在 Reynard 上安装。"
    static let addonRestricted = "%@ 受限，无法在 Reynard 上安装。"
    static let incompatibleMessage = "%@ 无法安装，因为它与此版本的 Reynard 不兼容。"
    static let adminOnlyMessage = "%@ 无法安装，因为它只能由使用企业策略的组织安装，此平台不支持。"
    static let failedToInstallAddon = "未能安装 %@。"
    static let addonNeedsPermissionToUpdate = "%d 个扩展需要权限才能更新。"

    // MARK: - 扩展错误代码
    static let errorNetworkFailure = "ERROR_NETWORK_FAILURE"
    static let errorCorruptFile = "ERROR_CORRUPT_FILE"
    static let errorSignedStateRequired = "ERROR_SIGNEDSTATE_REQUIRED"
    static let errorBlocklisted = "ERROR_BLOCKLISTED"
    static let errorIncompatible = "ERROR_INCOMPATIBLE"
    static let errorAdminInstallOnly = "ERROR_ADMIN_INSTALL_ONLY"
    static let errorSoftBlocked = "ERROR_SOFT_BLOCKED"
    static let errorPostponed = "ERROR_POSTPONED"
    static let errorUserCanceledCode = "ERROR_USER_CANCELED"
    static let errorAbortedCode = "ERROR_ABORTED"
    static let errorUserCancelledCode = "ERROR_USER_CANCELLED"

    // MARK: - 地址栏和工具栏
    static let addBookmark = "添加书签"
    static let editBookmark = "编辑书签"
    static let addToFavorites = "添加到收藏夹"
    static let noAddons = "无扩展"
    static let manageAddons = "管理扩展"
    static let requestMobileWebsite = "请求移动版网站"
    static let requestDesktopWebsite = "请求桌面版网站"
    static let downloads = "下载"
    static let back = "后退"
    static let forward = "前进"
    static let share = "分享"
    static let library = "资料库"
    static let tabOverview = "标签页概览"
    static let newTab = "新标签页"
    static let sidebar = "侧边栏"
    static let updateAvailable = "有可用更新"
    static let websiteSettings = "网站设置"

    // MARK: - 日期时间选择器
    static let date = "日期"
    static let time = "时间"
    static let datetimeLocal = "本地日期时间"

    // MARK: - 文件选择器
    static let photoLibrary = "照片图库"
    static let camera = "相机"
    static let chooseFile = "选择文件"
    static let chooseFolder = "选择文件夹"

    // MARK: - 搜索
    static let suggestions = "建议"
    static let bookmarksHistoryAndTabs = "书签、历史记录和标签页"
}
