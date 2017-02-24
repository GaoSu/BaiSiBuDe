//
//  URLConfig.h
//  ;
//
//  Created by zjt on 16/2/20.
//  Copyright © 2016年 zjt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface URLConfig : NSObject

    //测试服务器地址
    extern NSString *TOPIC;

    //获取验证码
    extern NSString *ACTION_GET_SMSCODE;

    //注册验证
    extern NSString *ACTION_CHECK_VERIFICATION;

    //获取所有城市
    extern NSString *ACTION_GET_CITY_LIST;

    //根据城市查询社区
    extern NSString *ACTION_GET_COMMUNITY_BY_CITY;

    //游客模式根据城市查询社区
    extern NSString *ACTION_GET_TOURISTS_CITY;

    //根据社区查询楼栋
    extern NSString *ACTION_GET_BUILD_BY_COMMUNITY_ID;

    //用户注册 - 创建马甲
    extern NSString *ACTION_REGISTER_AVATAR;

    //账号-密码登录
    extern NSString *ACTION_ACCOUNT_LOGIN;

    //手机验证码登录
    extern NSString *ACTION_SMS_CODE_LOGIN;

    //修改密码
    extern NSString *ACTION_UPDATE_PWD;

    //更新绑定验证码
    extern NSString *ACTION_MODIFY_PHONE;

    //发送验证邮件
    extern NSString *ACTION_SEND_EMAIl;

    //绑定邮箱
    extern NSString *ACTION_MODIFY_EMAIL;

    //意见反馈
    extern NSString *ACTION_ADD_FEEDBACK;

    //修改个人信息
    extern NSString *ACTION_MODIFY_USER_DETAIL;

    //多图片上传
    extern NSString *ACTION_MULTI_UPLOAD_IMAGE;

    //上传头像
    extern NSString *ACTION_UPLOAD_IMAGE;

    //收货地址 - crud
    extern NSString *ACTION_ADD_ADDRESS_BOOK;
    extern NSString *ACTION_DELETE_ADDRESS_BOOK;
    extern NSString *ACTION_UPDATE_ADDRESS_BOOK;
    extern NSString *ACTION_QUERY_ADDRESS_BOOK_LIST;

    //获取推送消息详情
    extern NSString *ACTION_GET_PUSH_MESSAGE_DETAIL;

    //邻服务
    extern NSString * ACTION_GET_SERVICE;

    //邻服务二级黄页
    extern  NSString * ACTION_GET_SERVICE_YELLOW;

    //发布话题、活动
    extern  NSString * ACTION_PUBLISH_TOPIC;

    //查询活动
    extern  NSString * ACTION_QUERY_TOPIC_LIST;

    //搜索分类帖子列表
    extern NSString * ACTION_QUERY_CATEGORY_TOPIC_LESS_LIST;

    //帖子详情
    extern NSString * ACTION_QUERY_TOPIC_DETAIL;

    //回复话题
    extern NSString * ACTION_REPLY_TOPIC;
    extern NSString * ACTION_UPDATE_REPLY;
    extern NSString * ACTION_DELETE_REPLY;

    //收藏话题、活动
    extern NSString *ACTION_CANCEL_COLLECT_TOPIC;
    extern NSString *ACTION_COLLECT_TOPIC;

    //举报话题、活动
    extern NSString *ACTION_REPORT_TOPIC;

    //回复列表
    extern NSString *ACTION_QUERY_TOPIC_REPLY_LIST;

    //切换社区列表
    extern NSString *ACTION_QUERY_USER_COMMUNITY_LIST;

    //添加马甲
    extern NSString *ACTION_ADD_AVATAR;

    //切换社区
    extern NSString *ACTION_SWITCH_COMMUNITY;

    //分享话题、活动、二手交易的路径（即社区）
    extern NSString *ACTION_SHARE_SQUARE_URL;

    extern NSString *ACTION_QUERYDEFAULT_ADDRESS_BOOK_LIST;

    extern NSString *ACTION_DEFAULT_ADDRESS_BOOK_LIST;

    //验证昵称是否重复
    extern NSString *ACTION_CHECK_BY_NICKNAME;

    /*
     *  邻生活
     */
    //邻空间—查询空间详情
    extern NSString *ACTION_QUERY_SPACE_DETAIL;

    //邻空间—查询空间服务
    extern NSString *ACTION_QUERY_SER_LIST;

    //购物车列表
    extern NSString *ACTION_QUERY_CAR_LIST;

    //收藏商品
    extern NSString *ACTION_COLLECTION_MERCHANDISE;

    //搜索商品列表
    extern NSString *ACTION_QUERY_MERCHANDISE_LIST_BY_NAME;

    //搜索推荐商品
    extern NSString *ACTION_QUERY_RECOMMEND_GOODS_LIST;

    //商品详情
    extern NSString *ACTION_QUERY_MERCHANDISE_DETAIL;

    //商品图册
    extern NSString *ACTION_QUERY_MERCHANDISE_RESOURCE;

    //商品列表
    extern NSString *ACTION_QUERY_MERCHANDISE_LIST;

    //商品分类列表
    extern NSString *ACTION_QUERY_SORT_INFO;

    //凑单商品
    extern NSString *ACTION_QUERY_ORDER_GOODS;

    //取消收藏商品
    extern NSString *ACTION_CANCEL_COLLECTION_MERCHANDISE;

    //删除购物车商品
    extern NSString *ACTION_DEL_MERCHANDISE_CART;

    //创建订单
    extern NSString *ACTION_CREATEORDER;

    //修改购物车商品数量
    extern NSString *ACTION_ADD_MERCHANDISE_CART;

    //促销信息
    extern NSString *ACTION_QUERY_PROMOTION;

    //小区公告详情
    extern NSString *ACTION_QUERY_NOTICEDETAIL;

    //小区公告
    extern NSString *ACTION_QUERY_NOTICE_LIST;

    //完成交易
    extern NSString *ACTION_UPDATE_SECOND_STATUS;

    //二手市场帖子分页搜索列表
    extern NSString *ACTION_QUERY_SECOND_TOPIC_LIST;

    //赞、取消赞
    extern NSString *ACTION_LIKE_OR_CANCEL_LIKE;

    //获取打赏名单
    extern NSString *ACTION_QUERY_GRATUITY_PERSON_LIST;

    /*
     *  支付接口
     */
    extern NSString *ACTION_WEIXIN_PAY;    //微信支付接口
    extern NSString *ACTION_ALI_PAY;        //支付宝

    //收藏列表
    extern NSString *ACTION_COLLECT_QUERY;
    extern NSString *ACTION_COLLECT_TYPE_QUERY;

    //收藏商品
    extern NSString *ACTION_COLLET_GOODS_LIST ;

    //客服电话
    extern NSString * ACTION_CUSTOMER_PHONE ;

    /*
     *  邻服务
     */
    //搜索周边信息
    extern NSString *ACTION_SEARCH_SERVICE_LIST;

    //累加拨打电话次数
    extern NSString *ACTION_ADD_CALLCOUNT;

    // 收藏的服务-分页搜索
    extern NSString *ACTION_COLLECT_SERVICE_LIST;

    //取消收藏商户黄页
    extern NSString *ACTION_CANCEL_COLLECT_YELLOWPAGE;

    //收藏商户黄页
    extern NSString *ACTION_COLLECT_YELLOWPAGE;

    //商户黄页—获取条目详情
    extern NSString *ACTION_YELLOWPAGE_PAGE_DETAIL;

    //商户黄页详情-右上角图片及总的图片数
    extern NSString *ACTION_YELLOWPAGE_PAGE_RTIMAGEINFO;

    //商户黄页详情-商家相册
    extern NSString *ACTION_YELLOWPAGE_PAGE_ALLIMAGEINFO;

    //商户黄页详情-提出修改建议
    extern NSString *ACTION_YELLOWPAGE_COMMITSUGGEST;

    //商户黄页详情-认领此商家
    extern NSString *ACTION_GET_YELLOWPAGE;

    //商户黄页详情-添加新商户
    extern NSString *ACTION_ADD_NEWYELLOWPAGE;

    //个人模块—订单列表
    extern NSString *ACTION_QUERY_ORDER;

    //个人模块—订单详情
    extern NSString *ACTION_QUERY_ORDER_DETAIL;

    //生活首页
    extern NSString *ACTION_LIFE_FIRST_LIST;

    //个人模块—删除订单
    extern NSString *ACTION_DEL_ORDER;

    //取消订单
    extern NSString *ACTION_CANCEL_ORDER;

    //查询消息列表
    extern NSString *ACTION_QUERY_MESSAGE_LIST;


//好友—首页—查询个人信息
extern NSString *ACTION_FRIEND_MAIN_INFO;

//好友—首页—各种帖子的数量
extern NSString *ACTION_FRIEND_SEARCH_COUNT;

//好友—查询粉丝列表
extern NSString *ACTION_FRIEND_SEARCH_Fans;

//好友—查询关注列表
extern NSString *ACTION_FRIEND_SEARCH_ATTENTIONS;

//好友—查看铃铛排名
extern NSString *ACTION_FRIEND_ROBIE_INFO;

//好友—取消关注
extern NSString *ACTION_FRIEND_CANCEL_ATTENTION;

//好友—加关注
extern NSString *ACTION_FRIEND_ADD_ATTENTION;

//好友—分类帖子列表
extern NSString *ACTION_FRIEND_POST_LIST;


//私信 - 查询聊天列表
extern NSString *ACTION_SEARCH_CHAT_LIST;

//私信 - 查询聊天内容记录
extern NSString *ACTION_SEARCH_CHAT_CONTENT_HISTORY;

//私信 - 发送聊天内容
extern NSString *ACTION_SEND_CHAT_CONTENT;

//统计用户启动app
extern NSString *ACTION_ADD_USER_LAUNCHAPPLOG;

//记录用户点击第三方o2o服务
extern NSString *ACTION_ADD_USER_CLICK_020_SERVICELOG;

//分页查询所有帖子列表
extern NSString *ACTION_QUERY_ALL_POST;

//分享到帖子列表
extern NSString *ACTION_SHARE_POST_TO_REPLY_LIST;

@end
