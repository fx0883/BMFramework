//
//  ShareSDKManager.m
//  PuzzleGame
//
//  Created by fx on 14/10/28.
//  Copyright (c) 2014年 FS. All rights reserved.
//

#import "ShareSDKManager.h"


#import <ShareSDK/ShareSDK.h>
#import "WeiboApi.h"
#import <TencentOpenAPI/QQApiInterface.h>
#import <TencentOpenAPI/TencentOAuth.h>
#import "WXApi.h"

#define SHARESDKAPPKEY @"4015d965c8c0"
#define CONTENT @"很厉害的分享，一定要看哦"

@implementation ShareSDKManager
DEF_SINGLETON(ShareSDKManager)


-(void)registSDKkey
{
    [ShareSDK registerApp:SHARESDKAPPKEY];
    [self initializePlat];
    
}

- (void)initializePlat
{
    /**
     连接新浪微博开放平台应用以使用相关功能，此应用需要引用SinaWeiboConnection.framework
     http://open.weibo.com上注册新浪微博开放平台应用，并将相关信息填写到以下字段
     **/
    [ShareSDK connectSinaWeiboWithAppKey:@"568898243"
                               appSecret:@"38a4f8204cc784f81f9f0daaf31e02e3"
                             redirectUri:@"http://www.sharesdk.cn"];
    
    /**
     连接腾讯微博开放平台应用以使用相关功能，此应用需要引用TencentWeiboConnection.framework
     http://dev.t.qq.com上注册腾讯微博开放平台应用，并将相关信息填写到以下字段
     
     如果需要实现SSO，需要导入libWeiboSDK.a，并引入WBApi.h，将WBApi类型传入接口
     **/
    [ShareSDK connectTencentWeiboWithAppKey:@"801548925"
                                  appSecret:@"a5dd78c255e81395cd24c358651666f5"
                                redirectUri:@"https://itunesconnect.apple.com/WebObjects/iTunesConnect.woa/ra/ng/app/921615471"
                                   wbApiCls:[WeiboApi class]];
    
    //连接短信分享
    [ShareSDK connectSMS];
    
    /**
     连接QQ空间应用以使用相关功能，此应用需要引用QZoneConnection.framework
     http://connect.qq.com/intro/login/上申请加入QQ登录，并将相关信息填写到以下字段
     
     如果需要实现SSO，需要导入TencentOpenAPI.framework,并引入QQApiInterface.h和TencentOAuth.h，将QQApiInterface和TencentOAuth的类型传入接口
     **/
    [ShareSDK connectQZoneWithAppKey:@"801548925"
                           appSecret:@"a5dd78c255e81395cd24c358651666f5"
                   qqApiInterfaceCls:[QQApiInterface class]
                     tencentOAuthCls:[TencentOAuth class]];
    
    /**
     连接微信应用以使用相关功能，此应用需要引用WeChatConnection.framework和微信官方SDK
     http://open.weixin.qq.com上注册应用，并将相关信息填写以下字段
     **/
    //    [ShareSDK connectWeChatWithAppId:@"wx4868b35061f87885" wechatCls:[WXApi class]];
    [ShareSDK connectWeChatWithAppId:@"wx4868b35061f87885"
                           appSecret:@"64020361b8ec4c99936c0e3999a9f249"
                           wechatCls:[WXApi class]];
    
    /**
     连接QQ应用以使用相关功能，此应用需要引用QQConnection.framework和QQApi.framework库
     http://mobile.qq.com/api/上注册应用，并将相关信息填写到以下字段
     **/
    //旧版中申请的AppId（如：QQxxxxxx类型），可以通过下面方法进行初始化
    //    [ShareSDK connectQQWithAppId:@"QQ075BCD15" qqApiCls:[QQApi class]];
    
    [ShareSDK connectQQWithQZoneAppKey:@"801548925"
                     qqApiInterfaceCls:[QQApiInterface class]
                       tencentOAuthCls:[TencentOAuth class]];
    
    
    /**
     连接Facebook应用以使用相关功能，此应用需要引用FacebookConnection.framework
     https://developers.facebook.com上注册应用，并将相关信息填写到以下字段
     **/
    [ShareSDK connectFacebookWithAppKey:@"107704292745179"
                              appSecret:@"38053202e1a5fe26c80c753071f0b573"];
    
    /**
     连接Twitter应用以使用相关功能，此应用需要引用TwitterConnection.framework
     https://dev.twitter.com上注册应用，并将相关信息填写到以下字段
     **/
    [ShareSDK connectTwitterWithConsumerKey:@"mnTGqtXk0TYMXYTN7qUxg"
                             consumerSecret:@"ROkFqr8c3m1HXqS3rm3TJ0WkAJuwBOSaWhPbZ9Ojuc"
                                redirectUri:@"http://www.sharesdk.cn"];
    
    /**
     连接Google+应用以使用相关功能，此应用需要引用GooglePlusConnection.framework、GooglePlus.framework和GoogleOpenSource.framework库
     https://code.google.com/apis/console上注册应用，并将相关信息填写到以下字段
     **/
    //    [ShareSDK connectGooglePlusWithClientId:@"232554794995.apps.googleusercontent.com"
    //                               clientSecret:@"PEdFgtrMw97aCvf0joQj7EMk"
    //                                redirectUri:@"http://localhost"
    //                                  signInCls:[GPPSignIn class]
    //                                   shareCls:[GPPShare class]];
    
//    /**
//     连接人人网应用以使用相关功能，此应用需要引用RenRenConnection.framework
//     http://dev.renren.com上注册人人网开放平台应用，并将相关信息填写到以下字段
//     **/
//    [ShareSDK connectRenRenWithAppId:@"226427"
//                              appKey:@"fc5b8aed373c4c27a05b712acba0f8c3"
//                           appSecret:@"f29df781abdd4f49beca5a2194676ca4"
//                   renrenClientClass:[RennClient class]];
//    
//    /**
//     连接开心网应用以使用相关功能，此应用需要引用KaiXinConnection.framework
//     http://open.kaixin001.com上注册开心网开放平台应用，并将相关信息填写到以下字段
//     **/
//    [ShareSDK connectKaiXinWithAppKey:@"358443394194887cee81ff5890870c7c"
//                            appSecret:@"da32179d859c016169f66d90b6db2a23"
//                          redirectUri:@"http://www.sharesdk.cn/"];
//    
//    /**
//     连接易信应用以使用相关功能，此应用需要引用YiXinConnection.framework
//     http://open.yixin.im/上注册易信开放平台应用，并将相关信息填写到以下字段
//     **/
//    [ShareSDK connectYiXinWithAppId:@"yx0d9a9f9088ea44d78680f3274da1765f"
//                           yixinCls:[YXApi class]];
    
    //连接邮件
    [ShareSDK connectMail];
    
    //连接打印
    [ShareSDK connectAirPrint];
    
    //连接拷贝
    [ShareSDK connectCopy];
    
    /**
     连接搜狐微博应用以使用相关功能，此应用需要引用SohuWeiboConnection.framework
     http://open.t.sohu.com上注册搜狐微博开放平台应用，并将相关信息填写到以下字段
     **/
    [ShareSDK connectSohuWeiboWithConsumerKey:@"q70QBQM9T0COxzYpGLj9"
                               consumerSecret:@"XXYrx%QXbS!uA^m2$8TaD4T1HQoRPUH0gaG2BgBd"
                                  redirectUri:@"http://www.sharesdk.cn"];
    
    /**
     连接网易微博应用以使用相关功能，此应用需要引用T163WeiboConnection.framework
     http://open.t.163.com上注册网易微博开放平台应用，并将相关信息填写到以下字段
     **/
    [ShareSDK connect163WeiboWithAppKey:@"T5EI7BXe13vfyDuy"
                              appSecret:@"gZxwyNOvjFYpxwwlnuizHRRtBRZ2lV1j"
                            redirectUri:@"http://www.shareSDK.cn"];
    
    /**
     连接豆瓣应用以使用相关功能，此应用需要引用DouBanConnection.framework
     http://developers.douban.com上注册豆瓣社区应用，并将相关信息填写到以下字段
     **/
    [ShareSDK connectDoubanWithAppKey:@"02e2cbe5ca06de5908a863b15e149b0b"
                            appSecret:@"9f1e7b4f71304f2f"
                          redirectUri:@"http://www.sharesdk.cn"];
    
    /**
     连接印象笔记应用以使用相关功能，此应用需要引用EverNoteConnection.framework
     http://dev.yinxiang.com上注册应用，并将相关信息填写到以下字段
     **/
    [ShareSDK connectEvernoteWithType:SSEverNoteTypeSandbox
                          consumerKey:@"sharesdk-7807"
                       consumerSecret:@"d05bf86993836004"];
    
    /**
     连接LinkedIn应用以使用相关功能，此应用需要引用LinkedInConnection.framework库
     https://www.linkedin.com/secure/developer上注册应用，并将相关信息填写到以下字段
     **/
    [ShareSDK connectLinkedInWithApiKey:@"ejo5ibkye3vo"
                              secretKey:@"cC7B2jpxITqPLZ5M"
                            redirectUri:@"http://sharesdk.cn"];
    
//    /**
//     连接Pinterest应用以使用相关功能，此应用需要引用Pinterest.framework库
//     http://developers.pinterest.com/上注册应用，并将相关信息填写到以下字段
//     **/
//    [ShareSDK connectPinterestWithClientId:@"1432928"
//                              pinterestCls:[Pinterest class]];
    
    /**
     连接Pocket应用以使用相关功能，此应用需要引用PocketConnection.framework
     http://getpocket.com/developer/上注册应用，并将相关信息填写到以下字段
     **/
    [ShareSDK connectPocketWithConsumerKey:@"11496-de7c8c5eb25b2c9fcdc2b627"
                               redirectUri:@"pocketapp1234"];
    
    /**
     连接Instapaper应用以使用相关功能，此应用需要引用InstapaperConnection.framework
     http://www.instapaper.com/main/request_oauth_consumer_token上注册Instapaper应用，并将相关信息填写到以下字段
     **/
    [ShareSDK connectInstapaperWithAppKey:@"4rDJORmcOcSAZL1YpqGHRI605xUvrLbOhkJ07yO0wWrYrc61FA"
                                appSecret:@"GNr1GespOQbrm8nvd7rlUsyRQsIo3boIbMguAl9gfpdL0aKZWe"];
    
    /**
     连接有道云笔记应用以使用相关功能，此应用需要引用YouDaoNoteConnection.framework
     http://note.youdao.com/open/developguide.html#app上注册应用，并将相关信息填写到以下字段
     **/
    [ShareSDK connectYouDaoNoteWithConsumerKey:@"dcde25dca105bcc36884ed4534dab940"
                                consumerSecret:@"d98217b4020e7f1874263795f44838fe"
                                   redirectUri:@"http://www.sharesdk.cn/"];
    
    /**
     连接搜狐随身看应用以使用相关功能，此应用需要引用SohuConnection.framework
     https://open.sohu.com上注册应用，并将相关信息填写到以下字段
     **/
    [ShareSDK connectSohuKanWithAppKey:@"e16680a815134504b746c86e08a19db0"
                             appSecret:@"b8eec53707c3976efc91614dd16ef81c"
                           redirectUri:@"http://sharesdk.cn"];
    
    /**
     链接Flickr,此平台需要引用FlickrConnection.framework框架。
     http://www.flickr.com/services/apps/create/上注册应用，并将相关信息填写以下字段。
     **/
    [ShareSDK connectFlickrWithApiKey:@"33d833ee6b6fca49943363282dd313dd"
                            apiSecret:@"3a2c5b42a8fbb8bb"];
    
    /**
     链接Tumblr,此平台需要引用TumblrConnection.framework框架
     http://www.tumblr.com/oauth/apps上注册应用，并将相关信息填写以下字段。
     **/
    [ShareSDK connectTumblrWithConsumerKey:@"2QUXqO9fcgGdtGG1FcvML6ZunIQzAEL8xY6hIaxdJnDti2DYwM"
                            consumerSecret:@"3Rt0sPFj7u2g39mEVB3IBpOzKnM3JnTtxX2bao2JKk4VV1gtNo"
                               callbackUrl:@"http://sharesdk.cn"];
    
    /**
     连接Dropbox应用以使用相关功能，此应用需要引用DropboxConnection.framework库
     https://www.dropbox.com/developers/apps上注册应用，并将相关信息填写以下字段。
     **/
    [ShareSDK connectDropboxWithAppKey:@"7janx53ilz11gbs"
                             appSecret:@"c1hpx5fz6tzkm32"];
    
    /**
     连接Instagram应用以使用相关功能，此应用需要引用InstagramConnection.framework库
     http://instagram.com/developer/clients/register/上注册应用，并将相关信息填写以下字段
     **/
    [ShareSDK connectInstagramWithClientId:@"ff68e3216b4f4f989121aa1c2962d058"
                              clientSecret:@"1b2e82f110264869b3505c3fe34e31a1"
                               redirectUri:@"http://sharesdk.cn"];
    
    /**
     连接VKontakte应用以使用相关功能，此应用需要引用VKontakteConnection.framework库
     http://vk.com/editapp?act=create上注册应用，并将相关信息填写以下字段
     **/
    [ShareSDK connectVKontakteWithAppKey:@"3921561"
                               secretKey:@"6Qf883ukLDyz4OBepYF1"];
    
    /**
     连接明道应用以使用相关功能，此应用需要引用MingDaoConnection.framework库
     http://open.mingdao.com/上注册应用，并将相关信息填写以下字段
     **/
    [ShareSDK connectMingDaoWithAppKey:@"EEEE9578D1D431D3215D8C21BF5357E3"
                             appSecret:@"5EDE59F37B3EFA8F65EEFB9976A4E933"
                           redirectUri:@"http://sharesdk.cn"];
    
    /**
     连接Line应用以使用相关功能，此应用需要引用LineConnection.framework库
     **/
    [ShareSDK connectLine];
    
    /**
     连接WhatsApp应用以使用相关功能，此应用需要引用WhatsAppConnection.framework库
     **/
    [ShareSDK connectWhatsApp];
    
    /**
     连接KakaoTalk应用以使用相关功能，此应用需要引用KakaoTalkConnection.framework库
     **/
    [ShareSDK connectKaKaoTalk];
    
    /**
     连接KakaoStory应用以使用相关功能，此应用需要引用KakaoStoryConnection.framework库
     **/
    [ShareSDK connectKaKaoStory];
}


/**
 *	@brief	自定义分享菜单项按钮点击
 *
 *	@param 	sender 	事件对象
 */
- (void)customShareMenuClickHandler:(UIButton *)sender
{
    //定义菜单分享列表
    NSArray *shareList = [ShareSDK getShareListWithType:ShareTypeTwitter, ShareTypeFacebook, ShareTypeSinaWeibo, ShareTypeTencentWeibo, ShareTypeRenren, ShareTypeKaixin, ShareTypeSohuWeibo, ShareType163Weibo, nil];
    
    //创建分享内容
    NSString *imagePath = [[NSBundle mainBundle] pathForResource:@"bg" ofType:@"png"];
    id<ISSContent> publishContent = [ShareSDK content:@"这是一条很厉害的分享"
                                       defaultContent:@""
                                                image:[ShareSDK imageWithPath:imagePath]
                                                title:@"ShareSDK"
                                                  url:@"http://www.mob.com"
                                          description:NSLocalizedString(@"TEXT_TEST_MSG", @"这是一条测试信息")
                                            mediaType:SSPublishContentMediaTypeNews];
    
    //创建容器
    id<ISSContainer> container = [ShareSDK container];
    [container setIPadContainerWithView:sender arrowDirect:UIPopoverArrowDirectionUp];
    
    id<ISSAuthOptions> authOptions = [ShareSDK authOptionsWithAutoAuth:YES
                                                         allowCallback:YES
                                                         authViewStyle:SSAuthViewStyleFullScreenPopup
                                                          viewDelegate:nil
                                               authManagerViewDelegate:nil];
    
    //在授权页面中添加关注官方微博
    [authOptions setFollowAccounts:[NSDictionary dictionaryWithObjectsAndKeys:
                                    [ShareSDK userFieldWithType:SSUserFieldTypeName value:@"ShareSDK"],
                                    SHARE_TYPE_NUMBER(ShareTypeSinaWeibo),
                                    [ShareSDK userFieldWithType:SSUserFieldTypeName value:@"ShareSDK"],
                                    SHARE_TYPE_NUMBER(ShareTypeTencentWeibo),
                                    nil]];
    
    //显示分享菜单
    [ShareSDK showShareActionSheet:container
                         shareList:shareList
                           content:publishContent
                     statusBarTips:YES
                       authOptions:authOptions
                      shareOptions:[ShareSDK defaultShareOptionsWithTitle:nil
                                                          oneKeyShareList:[NSArray defaultOneKeyShareList]
                                                           qqButtonHidden:NO
                                                    wxSessionButtonHidden:NO
                                                   wxTimelineButtonHidden:NO
                                                     showKeyboardOnAppear:NO
                                                        shareViewDelegate:nil
                                                      friendsViewDelegate:nil
                                                    picViewerViewDelegate:nil]
                            result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                                
                                if (state == SSPublishContentStateSuccess)
                                {
                                    NSLog(NSLocalizedString(@"TEXT_SHARE_SUC", @"分享成功"));
                                }
                                else if (state == SSPublishContentStateFail)
                                {
                                    NSLog(NSLocalizedString(@"TEXT_SHARE_FAI", @"分享失败,错误码:%d,错误描述:%@"), [error errorCode], [error errorDescription]);
                                }
                            }];
}











/**
 *	@brief
 *
 *	@param 	sender 	事件对象
 */
- (void)noneUIShareAllButtonClickHandler:(id)sender
{
    NSString *imagePath = [[NSBundle mainBundle] pathForResource:@"bg" ofType:@"png"];
    
    //构造分享内容
    id<ISSContent> publishContent = [ShareSDK content:CONTENT
                                       defaultContent:@""
                                                image:[ShareSDK imageWithPath:imagePath]
                                                title:@"厉害的nb"
                                                  url:@"https://itunes.apple.com/us/app/puzzle-crazy/id921615471?l=zh&ls=1&mt=8"
                                          description:NSLocalizedString(@"TEXT_TEST_MSG", @"这是一条测试信息")
                                            mediaType:SSPublishContentMediaTypeNews];
    
    ///////////////////////
    //以下信息为特定平台需要定义分享内容，如果不需要可省略下面的添加方法
    
    //定制人人网信息
    [publishContent addRenRenUnitWithName:NSLocalizedString(@"TEXT_HELLO_RENREN", @"Hello 人人网")
                              description:INHERIT_VALUE
                                      url:INHERIT_VALUE
                                  message:INHERIT_VALUE
                                    image:INHERIT_VALUE
                                  caption:nil];
    
    //定制QQ空间信息
    [publishContent addQQSpaceUnitWithTitle:NSLocalizedString(@"TEXT_HELLO_QZONE", @"Hello QQ空间")
                                        url:INHERIT_VALUE
                                       site:nil
                                    fromUrl:nil
                                    comment:INHERIT_VALUE
                                    summary:INHERIT_VALUE
                                      image:INHERIT_VALUE
                                       type:INHERIT_VALUE
                                    playUrl:nil
                                       nswb:nil];
    
    //定制微信好友信息
    [publishContent addWeixinSessionUnitWithType:INHERIT_VALUE
                                         content:INHERIT_VALUE
                                           title:NSLocalizedString(@"TEXT_HELLO_WECHAT_SESSION", @"Hello 微信好友!")
                                             url:INHERIT_VALUE
                                      thumbImage:[ShareSDK imageWithUrl:@"http://img1.bdstatic.com/img/image/67037d3d539b6003af38f5c4c4f372ac65c1038b63f.jpg"]
                                           image:INHERIT_VALUE
                                    musicFileUrl:nil
                                         extInfo:nil
                                        fileData:nil
                                    emoticonData:nil];
    
    //定制微信朋友圈信息
    [publishContent addWeixinTimelineUnitWithType:[NSNumber numberWithInteger:SSPublishContentMediaTypeMusic]
                                          content:INHERIT_VALUE
                                            title:NSLocalizedString(@"TEXT_HELLO_WECHAT_TIMELINE", @"Hello 微信朋友圈!")
                                              url:@"http://y.qq.com/i/song.html#p=7B22736F6E675F4E616D65223A22E4BDA0E4B88DE698AFE79C9FE6ADA3E79A84E5BFABE4B990222C22736F6E675F5761704C69766555524C223A22687474703A2F2F74736D7573696332342E74632E71712E636F6D2F586B303051563558484A645574315070536F4B7458796931667443755A68646C2F316F5A4465637734356375386355672B474B304964794E6A3770633447524A574C48795333383D2F3634363232332E6D34613F7569643D32333230303738313038266469723D423226663D312663743D3026636869643D222C22736F6E675F5769666955524C223A22687474703A2F2F73747265616D31382E71716D757369632E71712E636F6D2F33303634363232332E6D7033222C226E657454797065223A2277696669222C22736F6E675F416C62756D223A22E5889BE980A0EFBC9AE5B08FE5B7A8E89B8B444E414C495645EFBC81E6BC94E594B1E4BC9AE5889BE7BAAAE5BD95E99FB3222C22736F6E675F4944223A3634363232332C22736F6E675F54797065223A312C22736F6E675F53696E676572223A22E4BA94E69C88E5A4A9222C22736F6E675F576170446F776E4C6F616455524C223A22687474703A2F2F74736D757369633132382E74632E71712E636F6D2F586C464E4D31354C5569396961495674593739786D436534456B5275696879366A702F674B65356E4D6E684178494C73484D6C6A307849634A454B394568572F4E3978464B316368316F37636848323568413D3D2F33303634363232332E6D70333F7569643D32333230303738313038266469723D423226663D302663743D3026636869643D2673747265616D5F706F733D38227D"
                                       thumbImage:[ShareSDK imageWithUrl:@"http://img1.bdstatic.com/img/image/67037d3d539b6003af38f5c4c4f372ac65c1038b63f.jpg"]
                                            image:INHERIT_VALUE
                                     musicFileUrl:@"http://mp3.mwap8.com/destdir/Music/2009/20090601/ZuiXuanMinZuFeng20090601119.mp3"
                                          extInfo:nil
                                         fileData:nil
                                     emoticonData:nil];
    
    //定制微信收藏信息
    [publishContent addWeixinFavUnitWithType:INHERIT_VALUE
                                     content:INHERIT_VALUE
                                       title:NSLocalizedString(@"TEXT_HELLO_WECHAT_FAV", @"Hello 微信收藏!")
                                         url:INHERIT_VALUE
                                  thumbImage:[ShareSDK imageWithUrl:@"http://img1.bdstatic.com/img/image/67037d3d539b6003af38f5c4c4f372ac65c1038b63f.jpg"]
                                       image:INHERIT_VALUE
                                musicFileUrl:nil
                                     extInfo:nil
                                    fileData:nil
                                emoticonData:nil];
    
//    //定制QQ分享信息
//    [publishContent addQQUnitWithType:INHERIT_VALUE
//                              content:INHERIT_VALUE
//                                title:@"Hello QQ!"
//                                  url:INHERIT_VALUE
//                                image:INHERIT_VALUE];
    
    
//    http://i2.mhimg.com/kl688file/2014-8/2014081310355938337.jpg
    
    
    //定制QQ分享信息
    [publishContent addQQUnitWithType:INHERIT_VALUE
                              content:INHERIT_VALUE
                                title:@"很厉害的游戏"
                                  url:INHERIT_VALUE
                                image:[ShareSDK imageWithUrl:@"http://i2.mhimg.com/kl688file/2014-8/2014081310355938337.jpg"]];
    
    //定制邮件信息
    [publishContent addMailUnitWithSubject:@"Hello Mail"
                                   content:INHERIT_VALUE
                                    isHTML:[NSNumber numberWithBool:YES]
                               attachments:INHERIT_VALUE
                                        to:nil
                                        cc:nil
                                       bcc:nil];
    
    //定制短信信息
    [publishContent addSMSUnitWithContent:@"Hello SMS"];
    
    //定制有道云笔记信息
    [publishContent addYouDaoNoteUnitWithContent:INHERIT_VALUE
                                           title:NSLocalizedString(@"TEXT_HELLO_YOUDAO_NOTE", @"Hello 有道云笔记")
                                          author:@"ShareSDK"
                                          source:nil
                                     attachments:INHERIT_VALUE];
    
    //定制Instapaper信息
    [publishContent addInstapaperContentWithUrl:INHERIT_VALUE
                                          title:@"Hello Instapaper"
                                    description:INHERIT_VALUE];
    
    //定制搜狐随身看信息
    [publishContent addSohuKanUnitWithUrl:INHERIT_VALUE];
    
    //结束定制信息
    ////////////////////////
    
    //创建弹出菜单容器
    id<ISSContainer> container = [ShareSDK container];
    [container setIPadContainerWithView:sender arrowDirect:UIPopoverArrowDirectionUp];
    
    id<ISSAuthOptions> authOptions = [ShareSDK authOptionsWithAutoAuth:YES
                                                         allowCallback:YES
                                                         authViewStyle:SSAuthViewStyleFullScreenPopup
                                                          viewDelegate:nil
//                                               authManagerViewDelegate:_appDelegate.viewDelegate
                                               authManagerViewDelegate:nil
                                      ];
    
    //在授权页面中添加关注官方微博
    [authOptions setFollowAccounts:[NSDictionary dictionaryWithObjectsAndKeys:
                                    [ShareSDK userFieldWithType:SSUserFieldTypeName value:@"ShareSDK"],
                                    SHARE_TYPE_NUMBER(ShareTypeSinaWeibo),
                                    [ShareSDK userFieldWithType:SSUserFieldTypeName value:@"ShareSDK"],
                                    SHARE_TYPE_NUMBER(ShareTypeTencentWeibo),
                                    nil]];
    
    //自定义新浪微博分享菜单项
    id<ISSShareActionSheetItem> sinaItem = [ShareSDK shareActionSheetItemWithTitle:[ShareSDK getClientNameWithType:ShareTypeSinaWeibo]
                                                                              icon:[ShareSDK getClientIconWithType:ShareTypeSinaWeibo]
                                                                      clickHandler:^{
                                                                          [ShareSDK shareContent:publishContent
                                                                                            type:ShareTypeSinaWeibo
                                                                                     authOptions:authOptions
                                                                                   statusBarTips:YES
                                                                                          result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                                                                                              
                                                                                              if (state == SSPublishContentStateSuccess)
                                                                                              {
                                                                                                  NSLog(NSLocalizedString(@"TEXT_SHARE_SUC", @"分享成功"));
                                                                                              }
                                                                                              else if (state == SSPublishContentStateFail)
                                                                                              {
                                                                                                  NSLog(NSLocalizedString(@"TEXT_SHARE_FAI", @"分享失败,错误码:%d,错误描述:%@"), [error errorCode], [error errorDescription]);
                                                                                              }
                                                                                          }];
                                                                      }];
    
    //自定义腾讯微博分享菜单项
    id<ISSShareActionSheetItem> tencentItem = [ShareSDK shareActionSheetItemWithTitle:[ShareSDK getClientNameWithType:ShareTypeTencentWeibo]
                                                                                 icon:[ShareSDK getClientIconWithType:ShareTypeTencentWeibo]
                                                                         clickHandler:^{
                                                                             [ShareSDK shareContent:publishContent
                                                                                               type:ShareTypeTencentWeibo
                                                                                        authOptions:authOptions
                                                                                      statusBarTips:YES
                                                                                             result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                                                                                                 
                                                                                                 if (state == SSPublishContentStateSuccess)
                                                                                                 {
                                                                                                     NSLog(NSLocalizedString(@"TEXT_SHARE_SUC", @"分享成功"));
                                                                                                 }
                                                                                                 else if (state == SSPublishContentStateFail)
                                                                                                 {
                                                                                                     NSLog(NSLocalizedString(@"TEXT_SHARE_FAI", @"分享失败,错误码:%d,错误描述:%@"), [error errorCode], [error errorDescription]);
                                                                                                 }
                                                                                             }];
                                                                         }];
    
    //自定义QQ空间分享菜单项
    id<ISSShareActionSheetItem> qzoneItem = [ShareSDK shareActionSheetItemWithTitle:[ShareSDK getClientNameWithType:ShareTypeQQSpace]
                                                                               icon:[ShareSDK getClientIconWithType:ShareTypeQQSpace]
                                                                       clickHandler:^{
                                                                           [ShareSDK shareContent:publishContent
                                                                                             type:ShareTypeQQSpace
                                                                                      authOptions:authOptions
                                                                                    statusBarTips:YES
                                                                                           result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                                                                                               
                                                                                               if (state == SSPublishContentStateSuccess)
                                                                                               {
                                                                                                   NSLog(NSLocalizedString(@"TEXT_SHARE_SUC", @"分享成功"));
                                                                                               }
                                                                                               else if (state == SSPublishContentStateFail)
                                                                                               {
                                                                                                   NSLog(NSLocalizedString(@"TEXT_SHARE_FAI", @"分享失败,错误码:%d,错误描述:%@"), [error errorCode], [error errorDescription]);
                                                                                               }
                                                                                           }];
                                                                       }];
    
    //自定义Facebook分享菜单项
    id<ISSShareActionSheetItem> fbItem = [ShareSDK shareActionSheetItemWithTitle:[ShareSDK getClientNameWithType:ShareTypeFacebook]
                                                                            icon:[ShareSDK getClientIconWithType:ShareTypeFacebook]
                                                                    clickHandler:^{
                                                                        [ShareSDK shareContent:publishContent
                                                                                          type:ShareTypeFacebook
                                                                                   authOptions:authOptions
                                                                                 statusBarTips:YES
                                                                                        result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                                                                                            
                                                                                            if (state == SSPublishContentStateSuccess)
                                                                                            {
                                                                                                NSLog(NSLocalizedString(@"TEXT_SHARE_SUC", @"分享成功"));
                                                                                            }
                                                                                            else if (state == SSPublishContentStateFail)
                                                                                            {
                                                                                                NSLog(NSLocalizedString(@"TEXT_SHARE_FAI", @"分享失败,错误码:%d,错误描述:%@"), [error errorCode], [error errorDescription]);
                                                                                            }
                                                                                        }];
                                                                    }];
    
    //自定义Twitter分享菜单项
    id<ISSShareActionSheetItem> twItem = [ShareSDK shareActionSheetItemWithTitle:[ShareSDK getClientNameWithType:ShareTypeTwitter]
                                                                            icon:[ShareSDK getClientIconWithType:ShareTypeTwitter]
                                                                    clickHandler:^{
                                                                        [ShareSDK shareContent:publishContent
                                                                                          type:ShareTypeTwitter
                                                                                   authOptions:authOptions
                                                                                 statusBarTips:YES
                                                                                        result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                                                                                            
                                                                                            if (state == SSPublishContentStateSuccess)
                                                                                            {
                                                                                                NSLog(NSLocalizedString(@"TEXT_SHARE_SUC", @"分享成功"));
                                                                                            }
                                                                                            else if (state == SSPublishContentStateFail)
                                                                                            {
                                                                                                NSLog(NSLocalizedString(@"TEXT_SHARE_FAI", @"分享失败,错误码:%d,错误描述:%@"), [error errorCode], [error errorDescription]);
                                                                                            }
                                                                                        }];
                                                                    }];
    
    //自定义人人网分享菜单项
    id<ISSShareActionSheetItem> rrItem = [ShareSDK shareActionSheetItemWithTitle:[ShareSDK getClientNameWithType:ShareTypeRenren]
                                                                            icon:[ShareSDK getClientIconWithType:ShareTypeRenren]
                                                                    clickHandler:^{
                                                                        [ShareSDK shareContent:publishContent
                                                                                          type:ShareTypeRenren
                                                                                   authOptions:authOptions
                                                                                 statusBarTips:YES
                                                                                        result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                                                                                            
                                                                                            if (state == SSPublishContentStateSuccess)
                                                                                            {
                                                                                                NSLog(NSLocalizedString(@"TEXT_SHARE_SUC", @"分享成功"));
                                                                                            }
                                                                                            else if (state == SSPublishContentStateFail)
                                                                                            {
                                                                                                NSLog(NSLocalizedString(@"TEXT_SHARE_FAI", @"分享失败,错误码:%d,错误描述:%@"), [error errorCode], [error errorDescription]);
                                                                                            }
                                                                                        }];
                                                                    }];
    
    //自定义开心网分享菜单项
    id<ISSShareActionSheetItem> kxItem = [ShareSDK shareActionSheetItemWithTitle:[ShareSDK getClientNameWithType:ShareTypeKaixin]
                                                                            icon:[ShareSDK getClientIconWithType:ShareTypeKaixin]
                                                                    clickHandler:^{
                                                                        [ShareSDK shareContent:publishContent
                                                                                          type:ShareTypeKaixin
                                                                                   authOptions:authOptions
                                                                                 statusBarTips:YES
                                                                                        result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                                                                                            
                                                                                            if (state == SSPublishContentStateSuccess)
                                                                                            {
                                                                                                NSLog(NSLocalizedString(@"TEXT_SHARE_SUC", @"分享成功"));
                                                                                            }
                                                                                            else if (state == SSPublishContentStateFail)
                                                                                            {
                                                                                                NSLog(NSLocalizedString(@"TEXT_SHARE_FAI", @"分享失败,错误码:%d,错误描述:%@"), [error errorCode], [error errorDescription]);
                                                                                            }
                                                                                        }];
                                                                    }];
    
    //自定义搜狐微博分享菜单项
    id<ISSShareActionSheetItem> shItem = [ShareSDK shareActionSheetItemWithTitle:[ShareSDK getClientNameWithType:ShareTypeSohuWeibo]
                                                                            icon:[ShareSDK getClientIconWithType:ShareTypeSohuWeibo]
                                                                    clickHandler:^{
                                                                        [ShareSDK shareContent:publishContent
                                                                                          type:ShareTypeSohuWeibo
                                                                                   authOptions:authOptions
                                                                                 statusBarTips:YES
                                                                                        result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                                                                                            
                                                                                            if (state == SSPublishContentStateSuccess)
                                                                                            {
                                                                                                NSLog(NSLocalizedString(@"TEXT_SHARE_SUC", @"分享成功"));
                                                                                            }
                                                                                            else if (state == SSPublishContentStateFail)
                                                                                            {
                                                                                                NSLog(NSLocalizedString(@"TEXT_SHARE_FAI", @"分享失败,错误码:%d,错误描述:%@"), [error errorCode], [error errorDescription]);
                                                                                            }
                                                                                        }];
                                                                    }];
    
    //自定义网易微博分享菜单项
    id<ISSShareActionSheetItem> wyItem = [ShareSDK shareActionSheetItemWithTitle:[ShareSDK getClientNameWithType:ShareType163Weibo]
                                                                            icon:[ShareSDK getClientIconWithType:ShareType163Weibo]
                                                                    clickHandler:^{
                                                                        [ShareSDK shareContent:publishContent
                                                                                          type:ShareType163Weibo
                                                                                   authOptions:authOptions
                                                                                 statusBarTips:YES
                                                                                        result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                                                                                            
                                                                                            
                                                                                            if (state == SSPublishContentStateSuccess)
                                                                                            {
                                                                                                NSLog(NSLocalizedString(@"TEXT_SHARE_SUC", @"分享成功"));
                                                                                            }
                                                                                            else if (state == SSPublishContentStateFail)
                                                                                            {
                                                                                                NSLog(NSLocalizedString(@"TEXT_SHARE_FAI", @"分享失败,错误码:%d,错误描述:%@"), [error errorCode], [error errorDescription]);
                                                                                            }
                                                                                        }];
                                                                    }];
    
    //自定义豆瓣分享菜单项
    id<ISSShareActionSheetItem> dbItem = [ShareSDK shareActionSheetItemWithTitle:[ShareSDK getClientNameWithType:ShareTypeDouBan]
                                                                            icon:[ShareSDK getClientIconWithType:ShareTypeDouBan]
                                                                    clickHandler:^{
                                                                        [ShareSDK shareContent:publishContent
                                                                                          type:ShareTypeDouBan
                                                                                   authOptions:authOptions
                                                                                 statusBarTips:YES
                                                                                        result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                                                                                            
                                                                                            if (state == SSPublishContentStateSuccess)
                                                                                            {
                                                                                                NSLog(NSLocalizedString(@"TEXT_SHARE_SUC", @"分享成功"));
                                                                                            }
                                                                                            else if (state == SSPublishContentStateFail)
                                                                                            {
                                                                                                NSLog(NSLocalizedString(@"TEXT_SHARE_FAI", @"分享失败,错误码:%d,错误描述:%@"), [error errorCode], [error errorDescription]);
                                                                                            }
                                                                                        }];
                                                                    }];
    
    //自定义Instapaper分享菜单项
    id<ISSShareActionSheetItem> ipItem = [ShareSDK shareActionSheetItemWithTitle:[ShareSDK getClientNameWithType:ShareTypeInstapaper]
                                                                            icon:[ShareSDK getClientIconWithType:ShareTypeInstapaper]
                                                                    clickHandler:^{
                                                                        [ShareSDK shareContent:publishContent
                                                                                          type:ShareTypeInstapaper
                                                                                   authOptions:authOptions
                                                                                 statusBarTips:YES
                                                                                        result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                                                                                            
                                                                                            if (state == SSPublishContentStateSuccess)
                                                                                            {
                                                                                                NSLog(NSLocalizedString(@"TEXT_SHARE_SUC", @"分享成功"));
                                                                                            }
                                                                                            else if (state == SSPublishContentStateFail)
                                                                                            {
                                                                                                NSLog(NSLocalizedString(@"TEXT_SHARE_FAI", @"分享失败,错误码:%d,错误描述:%@"), [error errorCode], [error errorDescription]);
                                                                                            }
                                                                                        }];
                                                                    }];
    
    //自定义有道云笔记分享菜单项
    id<ISSShareActionSheetItem> ydItem = [ShareSDK shareActionSheetItemWithTitle:[ShareSDK getClientNameWithType:ShareTypeYouDaoNote]
                                                                            icon:[ShareSDK getClientIconWithType:ShareTypeYouDaoNote]
                                                                    clickHandler:^{
                                                                        [ShareSDK shareContent:publishContent
                                                                                          type:ShareTypeYouDaoNote
                                                                                   authOptions:authOptions
                                                                                 statusBarTips:YES
                                                                                        result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                                                                                            
                                                                                            if (state == SSPublishContentStateSuccess)
                                                                                            {
                                                                                                NSLog(NSLocalizedString(@"TEXT_SHARE_SUC", @"分享成功"));
                                                                                            }
                                                                                            else if (state == SSPublishContentStateFail)
                                                                                            {
                                                                                                NSLog(NSLocalizedString(@"TEXT_SHARE_FAI", @"分享失败,错误码:%d,错误描述:%@"), [error errorCode], [error errorDescription]);
                                                                                            }
                                                                                        }];
                                                                    }];
    
    //自定义搜狐随身看分享菜单项
    id<ISSShareActionSheetItem> shkItem = [ShareSDK shareActionSheetItemWithTitle:[ShareSDK getClientNameWithType:ShareTypeSohuKan]
                                                                             icon:[ShareSDK getClientIconWithType:ShareTypeSohuKan]
                                                                     clickHandler:^{
                                                                         [ShareSDK shareContent:publishContent
                                                                                           type:ShareTypeSohuKan
                                                                                    authOptions:authOptions
                                                                                  statusBarTips:YES
                                                                                         result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                                                                                             
                                                                                             if (state == SSPublishContentStateSuccess)
                                                                                             {
                                                                                                 NSLog(NSLocalizedString(@"TEXT_SHARE_SUC", @"分享成功"));
                                                                                             }
                                                                                             else if (state == SSPublishContentStateFail)
                                                                                             {
                                                                                                 NSLog(NSLocalizedString(@"TEXT_SHARE_FAI", @"分享失败,错误码:%d,错误描述:%@"), [error errorCode], [error errorDescription]);
                                                                                             }
                                                                                         }];
                                                                     }];
    
    //自定义印象笔记分享菜单项
    id<ISSShareActionSheetItem> evnItem = [ShareSDK shareActionSheetItemWithTitle:[ShareSDK getClientNameWithType:ShareTypeEvernote]
                                                                             icon:[ShareSDK getClientIconWithType:ShareTypeEvernote]
                                                                     clickHandler:^{
                                                                         [ShareSDK shareContent:publishContent
                                                                                           type:ShareTypeEvernote
                                                                                    authOptions:authOptions
                                                                                  statusBarTips:YES
                                                                                         result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                                                                                             
                                                                                             if (state == SSPublishContentStateSuccess)
                                                                                             {
                                                                                                 NSLog(NSLocalizedString(@"TEXT_SHARE_SUC", @"分享成功"));
                                                                                             }
                                                                                             else if (state == SSPublishContentStateFail)
                                                                                             {
                                                                                                 NSLog(NSLocalizedString(@"TEXT_SHARE_FAI", @"分享失败,错误码:%d,错误描述:%@"), [error errorCode], [error errorDescription]);
                                                                                             }
                                                                                         }];
                                                                     }];
    
    //自定义Pocket分享菜单项
    id<ISSShareActionSheetItem> pkItem = [ShareSDK shareActionSheetItemWithTitle:[ShareSDK getClientNameWithType:ShareTypePocket]
                                                                            icon:[ShareSDK getClientIconWithType:ShareTypePocket]
                                                                    clickHandler:^{
                                                                        [ShareSDK shareContent:publishContent
                                                                                          type:ShareTypePocket
                                                                                   authOptions:authOptions
                                                                                 statusBarTips:YES
                                                                                        result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                                                                                            
                                                                                            if (state == SSPublishContentStateSuccess)
                                                                                            {
                                                                                                NSLog(NSLocalizedString(@"TEXT_SHARE_SUC", @"分享成功"));
                                                                                            }
                                                                                            else if (state == SSPublishContentStateFail)
                                                                                            {
                                                                                                NSLog(NSLocalizedString(@"TEXT_SHARE_FAI", @"分享失败,错误码:%d,错误描述:%@"), [error errorCode], [error errorDescription]);
                                                                                            }
                                                                                        }];
                                                                    }];
    
    
    //创建自定义分享列表
    NSArray *shareList = [ShareSDK customShareListWithType:
                          sinaItem,
                          tencentItem,
                          SHARE_TYPE_NUMBER(ShareTypeSMS),
                          qzoneItem,
                          SHARE_TYPE_NUMBER(ShareTypeWeixiSession),
                          SHARE_TYPE_NUMBER(ShareTypeWeixiTimeline),
                          SHARE_TYPE_NUMBER(ShareTypeQQ),
                          fbItem,
                          twItem,
//                          rrItem,
//                          kxItem,
//                          SHARE_TYPE_NUMBER(ShareTypeMail),
//                          SHARE_TYPE_NUMBER(ShareTypeAirPrint),
//                          SHARE_TYPE_NUMBER(ShareTypeCopy),
//                          shItem,
//                          wyItem,
//                          dbItem,
//                          evnItem,
//                          pkItem,
//                          ipItem,
//                          ydItem,
//                          shkItem,
                          nil];
    
    [ShareSDK showShareActionSheet:container
                         shareList:shareList
                           content:publishContent
                     statusBarTips:YES
                       authOptions:authOptions
                      shareOptions:[ShareSDK defaultShareOptionsWithTitle:nil
                                                          oneKeyShareList:[NSArray defaultOneKeyShareList]
                                                           qqButtonHidden:NO
                                                    wxSessionButtonHidden:NO
                                                   wxTimelineButtonHidden:NO
                                                     showKeyboardOnAppear:NO
//                                                        shareViewDelegate:_appDelegate.viewDelegate
                                                        shareViewDelegate:nil
//                                                      friendsViewDelegate:_appDelegate.viewDelegate
                                                      friendsViewDelegate:nil
                                                    picViewerViewDelegate:nil]
                            result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                                
                                if (state == SSPublishContentStateSuccess)
                                {
                                    NSLog(NSLocalizedString(@"TEXT_SHARE_SUC", @"发表成功"));
                                }
                                else if (state == SSPublishContentStateFail)
                                {
                                    NSLog(NSLocalizedString(@"TEXT_SHARE_FAI", @"发布失败!error code == %d, error code == %@"), [error errorCode], [error errorDescription]);
                                }
                            }];
}


@end
