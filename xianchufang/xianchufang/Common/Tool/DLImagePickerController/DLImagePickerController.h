//
//  DLImagePickerController.h
//  DLImagePickerController
//
//  Created by zhenglong duan on 20/03/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^DlImagePickerAcquirePhotosBlock)(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto);

typedef void (^DlImagePickerDeletePhotosAtIndexBlock)(NSInteger index);  //用来删除不要的图片

@interface DLImagePickerController : UIViewController
/*** 几个属性值 ***/
@property (nonatomic,assign) BOOL showTakePhotoBtnSwitch;  ///< 在内部显示拍照按钮;
@property (nonatomic,assign) BOOL sortAscendingSwitch;     ///< 照片排列按修改时间升序;
@property (nonatomic,assign) BOOL allowPickingVideoSwitch; ///< 允许选择视频;
@property (nonatomic,assign) BOOL allowPickingImageSwitch; ///< 允许选择图片;
@property (nonatomic,assign) BOOL allowPickingGifSwitch;///< 允许选择gif图
@property (nonatomic,assign) BOOL allowPickingOriginalPhotoSwitch; ///< 允许选择原图;
@property (nonatomic,assign) BOOL showSheetSwitch; ///< 显示一个sheet,把拍照按钮放在外面;
@property (nonatomic,strong) NSString *maxCountTF;  ///< 照片最大可选张数，设置为1即为单选模式;
@property (nonatomic,strong) NSString *columnNumberTF; ////每行展示照片
@property (nonatomic,assign) BOOL allowCropSwitch; //单选模式下允许裁剪
@property (nonatomic,assign) BOOL needCircleCropSwitch;// 使用圆形裁剪框
@property (nonatomic,copy) DlImagePickerAcquirePhotosBlock DlImagePickerAcquirePhotosBlock;

@property (nonatomic,copy) DlImagePickerDeletePhotosAtIndexBlock DlImagePickerDeletePhotosAtIndexBlock ;
@end
