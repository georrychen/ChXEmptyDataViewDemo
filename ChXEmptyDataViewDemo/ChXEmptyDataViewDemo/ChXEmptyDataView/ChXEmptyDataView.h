
#import <UIKit/UIKit.h>

/**
 空白页默认显示类型

 - EmptyTypeNoData: 无数据
 - EmptyTypeNoDataWithNextButton: 无数据+按钮
 - EmptyTypeError: 数据加载错误
 - EmptyTypeNotLogin: 未登录
 */
typedef NS_ENUM(NSInteger, ChXEmptyViewType) {
    EmptyTypeNoData,
    EmptyTypeNoDataWithNextButton,
    EmptyTypeError,
    EmptyTypeNotLogin
};

@interface ChXEmptyDataView : UIView
/**
 显示类型
 */
@property (nonatomic, assign) ChXEmptyViewType showType;
/**
 图片名
 */
@property (nonatomic, strong) NSString *imageName;
/**
 标题
 */
@property (nonatomic, strong) NSString *title;
/**
 子标题
 */
@property (nonatomic, strong) NSString *subTitle;
/**
 按钮标题
 */
@property (nonatomic, strong) NSString *buttonTitle;
/**
 按钮背景颜色
 */
@property (nonatomic, strong) UIColor *buttonBackgroudColor;
/**
 富文本字符串，内部处理，，逗号后面有一个空格，根据这个空格来划分前后文字颜色（这里需要自己根据业务逻辑修改）
 */
@property (nonatomic, strong) NSString *attributedTitle;

/**
 下一步按钮点击回调block
 */
@property (nonatomic, strong) void (^nextButtonDidSelecteBlock)(UIButton *);

/**
 封装一个快速返回实例对象的类方法
 
 @return ChXEmptyDataView 对象
 */
+ (instancetype)emptyDataView;


@end
