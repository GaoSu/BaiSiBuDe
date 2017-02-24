//
//  URLConfig.m
//  blrbl
//
//  Created by zjt on 16/2/20.
//  Copyright © 2016年 zjt. All rights reserved.

#import "URLConfig.h"

@implementation URLConfig

    //服务器地址
//   NSString* SERVER_URL = @"http://192.168.2.253:8080/bl";

//    NSString* SERVER_URL = @"http://rbl.52rbl.com:8080/poli";            //正式

    //获取验证码
    NSString *TOPIC = @"http://api.budejie.com/api/api_open.php";

    //注册验证
    NSString *ACTION_CHECK_VERIFICATION = @"/mobile/user/checkVerification.remote";

    //获取所有城市
    NSString *ACTION_GET_CITY_LIST = @"/mobile/user/queryCityList.remote";

    //根据城市查询社区
    NSString *ACTION_GET_COMMUNITY_BY_CITY = @"/mobile/user/queryCommunityList.remote";

    //游客模式根据城市查询社区
    NSString *ACTION_GET_TOURISTS_CITY = @"/mobile/user/queryTouristCommunityList.remote";

    //根据社区查询楼栋
    NSString *ACTION_GET_BUILD_BY_COMMUNITY_ID = @"/mobile/user/queryBuildList.remote";

    //用户注册 - 创建马甲
    NSString *ACTION_REGISTER_AVATAR = @"/mobile/user/registerAvatar.remote";

    //手机验证码登录
    NSString *ACTION_SMS_CODE_LOGIN = @"/mobile/user/loginForRandomPassword.remote";

    //账号-密码登录
    NSString *ACTION_ACCOUNT_LOGIN =  @"/mobile/user/loginForPassword.remote";

    //修改密码
    NSString *ACTION_UPDATE_PWD = @"/mobile/user/modifyPassword.remote";

    //更新绑定验证码
    NSString *ACTION_MODIFY_PHONE = @"/mobile/user/modifyPhone.remote";

    //发送验证邮件
    NSString *ACTION_SEND_EMAIl = @"/mobile/user/sendEmail.remote";

    //绑定邮箱
    NSString *ACTION_MODIFY_EMAIL = @"/mobile/user/modifyEmail.remote";

    //意见反馈
    NSString *ACTION_ADD_FEEDBACK = @"/mobile/user/addFeedback.remote";

    //修改个人信息
    NSString *ACTION_MODIFY_USER_DETAIL = @"/mobile/user/modifyUserDetail.remote";

    //上传头像
    NSString *ACTION_UPLOAD_IMAGE = @"/mobile/user/uploadImg.remote";

    //多图片上传
    NSString *ACTION_MULTI_UPLOAD_IMAGE = @"/mobile/common/commonUploadImg.remote";

    //收货地址 - crud
    NSString *ACTION_ADD_ADDRESS_BOOK = @"/mobile/user/addAddressBook.remote";
    NSString *ACTION_DELETE_ADDRESS_BOOK = @"/mobile/user/deleteAddressBook.remote";
    NSString *ACTION_UPDATE_ADDRESS_BOOK = @"/mobile/user/updateAddressBook.remote";
    NSString *ACTION_QUERY_ADDRESS_BOOK_LIST = @"/mobile/user/queryAddressBookList.remote";

    //获取推送消息详情
    NSString *ACTION_GET_PUSH_MESSAGE_DETAIL = @"/mobile/user/pushMessageDetail.remote";

    //邻服务
    NSString * ACTION_GET_SERVICE = @"/mobile/service/queryServiceList.remote";

    //邻服务二级黄页
    NSString * ACTION_GET_SERVICE_YELLOW = @"/mobile/service/querySecondServiceList.remote";

    //发布话题、活动、二手交易
    NSString * ACTION_PUBLISH_TOPIC = @"/mobile/square/publishTopic.remote";

    //查询帖子列表
    NSString * ACTION_QUERY_TOPIC_LIST = @"/mobile/square/queryTopicList.remote";

    //搜索分类帖子列表
    NSString * ACTION_QUERY_CATEGORY_TOPIC_LESS_LIST = @"/mobile/square/queryCategoryTopicLessList.remote";

    //帖子详情
    NSString * ACTION_QUERY_TOPIC_DETAIL = @"/mobile/square/queryTopicDetail.remote";

    //回复话题
    NSString * ACTION_REPLY_TOPIC = @"/mobile/square_reply/replyTopic.remote";
    NSString * ACTION_UPDATE_REPLY = @"/mobile/square_reply/updateRelpy.remote";


    //收藏话题、活动
    NSString *ACTION_CANCEL_COLLECT_TOPIC = @"/mobile/square/cancelCollectTopic.remote";
    NSString *ACTION_COLLECT_TOPIC = @"/mobile/square/collectTopic.remote";

    //举报话题、活动
    NSString *ACTION_REPORT_TOPIC = @"/mobile/square/informTopic.remote";

    //回复列表
    NSString *ACTION_QUERY_TOPIC_REPLY_LIST = @"/mobile/square_reply/queryTopicReplyList.remote";

    //删除回复
    NSString * ACTION_DELETE_REPLY = @"/mobile/square_reply/delReply.remote";

    //切换社区列表
    NSString *ACTION_QUERY_USER_COMMUNITY_LIST = @"/mobile/user/queryUserCommunityList.remote";

    //添加马甲
    NSString *ACTION_ADD_AVATAR = @"/mobile/user/addAvatar.remote";

    //切换社区
    NSString *ACTION_SWITCH_COMMUNITY = @"/mobile/user/switchCommunity.remote";

    //分享话题、活动、二手交易的路径（即社区）
    NSString *ACTION_SHARE_SQUARE_URL = @"/jsp/shareTemplate/topic.jsp?id=";

    NSString *ACTION_QUERYDEFAULT_ADDRESS_BOOK_LIST = @"/mobile/user/queryDefaultAddressBook.remote";

    NSString *ACTION_DEFAULT_ADDRESS_BOOK_LIST = @"/mobile/user/defaultAddressBook.remote";

    //验证昵称是否重复
    NSString *ACTION_CHECK_BY_NICKNAME = @"/mobile/user/checkUserByNickName.remote";

    /*
     *  邻生活
     */
    //邻空间—查询空间详情
    NSString *ACTION_QUERY_SPACE_DETAIL = @"/mobile/life/querySpaceDetail.remote";

    //邻空间—查询空间服务
    NSString *ACTION_QUERY_SER_LIST = @"/mobile/life/querySerList.remote";

    //购物车列表
    NSString *ACTION_QUERY_CAR_LIST = @"/mobile/life/queryCartList.remote";

    //收藏商品
    NSString *ACTION_COLLECTION_MERCHANDISE = @"/mobile/life/collectionMerchandise.remote";

    //搜索商品列表
    NSString *ACTION_QUERY_MERCHANDISE_LIST_BY_NAME = @"/mobile/life/queryMerchandiseListByName.remote";

    //搜索推荐商品
    NSString *ACTION_QUERY_RECOMMEND_GOODS_LIST = @"/mobile/life/queryRecommendGoodsList.remote";

    //商品详情
    NSString *ACTION_QUERY_MERCHANDISE_DETAIL = @"/mobile/life/queryMerchandiseDetail.remote";

    //商品图册
    NSString *ACTION_QUERY_MERCHANDISE_RESOURCE = @"/mobile/life/queryMerchandiseResource.remote";

    //商品列表
    NSString *ACTION_QUERY_MERCHANDISE_LIST = @"/mobile/life/queryMerchandiseList.remote";

    //商品分类列表
    NSString *ACTION_QUERY_SORT_INFO = @"/mobile/life/querySortInfo.remote";

    //凑单商品
    NSString *ACTION_QUERY_ORDER_GOODS = @"/mobile/life/queryMakeUpAnOrderGoods.remote";

    //取消收藏商品
    NSString *ACTION_CANCEL_COLLECTION_MERCHANDISE = @"/mobile/life/cancelCollectionMerchandise.remote";

    //删除购物车商品
    NSString *ACTION_DEL_MERCHANDISE_CART = @"/mobile/life/delMerchandiseCart.remote";

    //创建订单
    NSString *ACTION_CREATEORDER = @"/mobile/v3/order/createOrder.remote";
//    NSString *ACTION_CREATEORDER = @"/mobile/life/createOrder.remote";

    //修改购物车商品数量
    NSString *ACTION_ADD_MERCHANDISE_CART = @"/mobile/life/addMerchandiseCart.remote";

    //促销信息
    NSString *ACTION_QUERY_PROMOTION = @"/mobile/life/queryPromotion.remote";

    //小区公告详情
    NSString *ACTION_QUERY_NOTICEDETAIL = @"/mobile/life/queryNoticeDetail.remote";

    //小区公告
    NSString *ACTION_QUERY_NOTICE_LIST = @"/mobile/life/queryNoticeList.remote";

    //完成交易
    NSString *ACTION_UPDATE_SECOND_STATUS = @"/mobile/square/updateSecondStatus.remote";

    //二手市场帖子分页搜索列表
    NSString *ACTION_QUERY_SECOND_TOPIC_LIST = @"/mobile/square/querySecondTopicList.remote";

    //赞、取消赞
    NSString *ACTION_LIKE_OR_CANCEL_LIKE = @"/mobile/square/zanOrCancelZan.remote";

    //获取打赏名单
    NSString *ACTION_QUERY_GRATUITY_PERSON_LIST = @"/mobile/square_gratuity/queryGratuityPersonList.remote";

    /*
     * 支付接口
     */
    //微信接口
    NSString *ACTION_WEIXIN_PAY = @"/mobile/pay/createWeixinpay.remote";


    //支付宝接口
    NSString *ACTION_ALI_PAY = @"/mobile/pay/createAlipay.remote";

    //收藏列表
    NSString *ACTION_COLLECT_QUERY = @"/mobile/collect/collectQuery.remote";
    NSString *ACTION_COLLECT_TYPE_QUERY = @"/mobile/collect/collectTypeQuery.remote";

    //收藏列表  -------------1话题;2活动;3商品;5二手市场
    NSString *ACTION_COLLET_GOODS_LIST = @"/mobile/collect/collectTypeQuery.remote";

    //客服电话
    NSString *ACTION_CUSTOMER_PHONE = @"/mobile/life/getCustomerServicePhone.remote";


    //搜索周边信息
    NSString *ACTION_SEARCH_SERVICE_LIST = @"/mobile/service/searchServiceList.remote";

    //累加拨打电话次数
    NSString *ACTION_ADD_CALLCOUNT = @"/mobile/service/addYellowPageCallCount.remote";

    // 收藏的服务-分页搜索
    NSString *ACTION_COLLECT_SERVICE_LIST = @"/mobile/service/collectServiceList.remote";

    //取消收藏商户黄页
    NSString *ACTION_CANCEL_COLLECT_YELLOWPAGE = @"/mobile/service/cancelCollectYellowPage.remote";

    //收藏商户黄页
    NSString *ACTION_COLLECT_YELLOWPAGE = @"/mobile/service/collectYellowPage.remote";

    //商户黄页—获取条目详情
    NSString *ACTION_YELLOWPAGE_PAGE_DETAIL = @"/mobile/service/queryYellowPageDetail.remote";

    //商户黄页详情-右上角图片及总的图片数
    NSString *ACTION_YELLOWPAGE_PAGE_RTIMAGEINFO = @"/mobile/service/queryYellowPageRtImageInfo.remote";

    //商户黄页详情-提出修改建议
    NSString *ACTION_YELLOWPAGE_COMMITSUGGEST = @"/mobile/service/commitsuggest.remote";

    //商户黄页详情-认领此商家
    NSString *ACTION_GET_YELLOWPAGE = @"/mobile/service/getYellowPage.remote";

    //商户黄页详情-添加新商户
    NSString *ACTION_ADD_NEWYELLOWPAGE = @"/mobile/service/addNewPageYellowInfo.remote";

    //个人模块—订单列表
    NSString *ACTION_QUERY_ORDER = @"/mobile/order/lookforOrder.remote";

    //个人模块—订单详情
    NSString *ACTION_QUERY_ORDER_DETAIL = @"/mobile/order/searchOrderDetail.remote";


//    //个人模块—订单列表
//    NSString *ACTION_QUERY_ORDER = @"/mobile/order/queryOrder.remote";
//
//    //个人模块—订单详情
//    NSString *ACTION_QUERY_ORDER_DETAIL = @"/mobile/order/queryOrderDetail.remote";


    //商户黄页详情-商家相册
    NSString *ACTION_YELLOWPAGE_PAGE_ALLIMAGEINFO = @"/mobile/service/queryYellowPageAllImageInfo.remote";

    //生活首页
    NSString *ACTION_LIFE_FIRST_LIST = @"/mobile/life/lifeListByid.remote";


    //个人模块—删除订单
    NSString *ACTION_DEL_ORDER = @"/mobile/order/delOrder.remote";


    //个人模块—取消订单
    NSString *ACTION_CANCEL_ORDER = @"/mobile/order/cancelOrder.remote";

    //查询消息列表
    NSString *ACTION_QUERY_MESSAGE_LIST = @"/mobile/user/searchMessageList.remote";


//好友—首页—查询个人信息
NSString *ACTION_FRIEND_MAIN_INFO = @"/mobile/friend/searchMainInfo.remote";

//好友—首页—各种帖子的数量
NSString *ACTION_FRIEND_SEARCH_COUNT = @"/mobile/friend/searchCount.remote";

//好友—查询粉丝列表
NSString *ACTION_FRIEND_SEARCH_Fans = @"/mobile/friend/searchFans.remote";

//好友—查询关注列表
NSString *ACTION_FRIEND_SEARCH_ATTENTIONS = @"/mobile/friend/searchAttentions.remote";

//好友—查看铃铛排名
NSString *ACTION_FRIEND_ROBIE_INFO = @"/mobile/friend/searchRobieInfo.remote";

//好友—取消关注
NSString *ACTION_FRIEND_CANCEL_ATTENTION = @"/mobile/friend/cancelAttention.remote";

//好友—加关注
NSString *ACTION_FRIEND_ADD_ATTENTION = @"/mobile/friend/addAttention.remote";

//好友—分类帖子列表
NSString *ACTION_FRIEND_POST_LIST = @"/mobile/friend/searchPostList.remote";


//私信 - 查询聊天列表
NSString *ACTION_SEARCH_CHAT_LIST = @"/mobile/chat/searchChatList.remote";

//私信 - 查询聊天内容记录
NSString *ACTION_SEARCH_CHAT_CONTENT_HISTORY = @"/mobile/chat/searchChatContent.remote";

//私信 - 发送聊天内容
NSString *ACTION_SEND_CHAT_CONTENT = @"/mobile/chat/saveChatContent.remote";

//统计用户启动app
NSString *ACTION_ADD_USER_LAUNCHAPPLOG = @"/mobile/statistics/addUserLaunchAppLog.remote";

//记录用户点击第三方o2o服务
NSString *ACTION_ADD_USER_CLICK_020_SERVICELOG = @"/mobile/statistics/addUserClickO2OServiceLog.remote";

//分页查询所有帖子列表
NSString *ACTION_QUERY_ALL_POST = @"/mobile/square/queryAllPost.remote";

//分享到帖子列表
NSString *ACTION_SHARE_POST_TO_REPLY_LIST = @"/mobile/square_reply/sharePostToReplyList.remote";

@end
