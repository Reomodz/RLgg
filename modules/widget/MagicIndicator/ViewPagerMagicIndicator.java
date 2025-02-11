package rlyun.modules.widget;

import android.content.Context;
import android.graphics.Color;
import android.graphics.drawable.Drawable;
import android.util.TypedValue;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.viewpager.widget.PagerAdapter;
import androidx.viewpager.widget.ViewPager;

import net.lucode.hackware.magicindicator.MagicIndicator;
import net.lucode.hackware.magicindicator.ViewPagerHelper;
import net.lucode.hackware.magicindicator.buildins.commonnavigator.CommonNavigatorFix;
import net.lucode.hackware.magicindicator.buildins.commonnavigator.abs.CommonNavigatorAdapter;
import net.lucode.hackware.magicindicator.buildins.commonnavigator.abs.IPagerIndicator;
import net.lucode.hackware.magicindicator.buildins.commonnavigator.abs.IPagerTitleView;
import net.lucode.hackware.magicindicator.buildins.commonnavigator.titles.CommonPagerTitleView;

import java.util.HashMap;

public class ViewPagerMagicIndicator extends LinearLayout {
    private ViewPager viewPager;
    private BaseMagicIndicator magicIndicator;
    private Context context;
    private BaseImpl BaseImpl;

    public static int dp(Context context, int v) {
        return (int) TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, v, context.getResources().getDisplayMetrics());
    }

    public ViewPager getViewPager() {
        return viewPager;
    }

    public BaseMagicIndicator getMagicIndicator() {
        return magicIndicator;
    }

    public CommonNavigatorFix getCommonNavigator() {
        return new CommonNavigatorFix(context);
    }

    public CommonPagerTitleViewImpl getCommonPagerTitleViewImpl() {
        return new CommonPagerTitleViewImpl(context);
    }

    public ViewPagerMagicIndicator(Context context) {
        super(context);

        this.context = context;
        this.setOrientation(LinearLayout.VERTICAL);

        LayoutParams lp1 = new LayoutParams(LayoutParams.MATCH_PARENT, 0);
        lp1.weight = 1;

        viewPager = new ViewPager(context);

        LayoutParams magicIndicatorlp = new LayoutParams(LayoutParams.MATCH_PARENT, dp(context, 64));
        magicIndicator = new BaseMagicIndicator(context);

        this.addView(viewPager, lp1);
        this.addView(magicIndicator, magicIndicatorlp);
    }


    public ViewPagerMagicIndicator(Context context, ViewPagerMagicIndicator.BaseImpl baseImpl) {
        this(context);
        BaseImpl = baseImpl;

        ViewPager viewPager = this.getViewPager();
        BaseMagicIndicator magicIndicator = this.getMagicIndicator();

        HashMap ContextViewHold = new HashMap();
        int count = BaseImpl.getCount();
        PagerAdapterImpl.Impl impl1 = new ViewPagerMagicIndicator.PagerAdapterImpl.Impl() {

            @Override
            public int getCount() {
                return count;
            }


            @Override
            public View getView(int position) {
                View o = (View) ContextViewHold.get(position);
                if (o != null) {
                    return o;
                }
                o = BaseImpl.getContextView(position);
                ContextViewHold.put(position, o);
                return o;
            }
        };

        PagerAdapterImpl adapter = new ViewPagerMagicIndicator.PagerAdapterImpl(impl1);
        viewPager.setAdapter(adapter);

        CommonNavigatorFix commonNavigatorFix = this.getCommonNavigator();
        commonNavigatorFix.setLayoutParams(new LayoutParams(LayoutParams.MATCH_PARENT, LayoutParams.MATCH_PARENT));

//        commonNavigatorFix.setAdjustMode(true);


        HashMap CommonPagerTitleViewHold = new HashMap();

        CommonNavigatorAdapterImpl.Impl impl = new CommonNavigatorAdapterImpl.Impl() {


            @Override
            public int getCount() {
                return count;
            }

            @Override
            public IPagerTitleView getTitleView(Context context, int index) {
                CommonPagerTitleView commonPagerTitleView = (CommonPagerTitleView) CommonPagerTitleViewHold.get(index);
                if (commonPagerTitleView != null) {
                    return commonPagerTitleView;
                }

                commonPagerTitleView = ViewPagerMagicIndicator.this.getCommonPagerTitleViewImpl();
                CommonPagerTitleViewHold.put(index, commonPagerTitleView);


                ImageView IconView = null;

                Drawable iconDrawable = BaseImpl.getIconDrawable(index);
                if (iconDrawable == null) {
                    int emo_im_laughing = getResources().getIdentifier("emo_im_laughing", "drawable", "android");
                    iconDrawable = getResources().getDrawable(emo_im_laughing);
                }

                if (iconDrawable != null) {
                    IconView = magicIndicator.getIcon(iconDrawable);
                }

                String title = BaseImpl.getTitleView(index);
                if (title == null) {
                    title = "project" + index;
                }

                TextView TitleView = magicIndicator.getTitle(title);
                ViewGroup customLayout = magicIndicator.getCustomLayout(IconView, TitleView);

                commonPagerTitleView.setContentView(customLayout);

                ImageView finalIconView = IconView;

                ViewPagerMagicIndicator.CommonPagerTitleViewImpl.OnPagerTitleChangeListenerImpl.Impl impl = new ViewPagerMagicIndicator.CommonPagerTitleViewImpl.OnPagerTitleChangeListenerImpl.Impl() {

                    @Override
                    public ImageView getIconView() {
                        return finalIconView;
                    }

                    @Override
                    public TextView getTitleView() {
                        System.out.println("getTitleView");
                        return TitleView;
                    }

                };

                ViewPagerMagicIndicator.CommonPagerTitleViewImpl.OnPagerTitleChangeListenerImpl listener = new ViewPagerMagicIndicator.CommonPagerTitleViewImpl.OnPagerTitleChangeListenerImpl(impl);
                commonPagerTitleView.setOnPagerTitleChangeListener(listener);


                commonPagerTitleView.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        viewPager.setCurrentItem(index);
                    }
                });

                return commonPagerTitleView;
            }

            @Override
            public IPagerIndicator getIndicator(Context context) {
                return null;
            }
        };


        commonNavigatorFix.setAdapter(new ViewPagerMagicIndicator.CommonNavigatorAdapterImpl(impl));
        magicIndicator.setNavigator(commonNavigatorFix);
        ViewPagerHelper.bind(magicIndicator, viewPager);
    }

    public interface BaseImpl {
        default int getCount() {
            return 0;
        }

        View getContextView(int position);

        Drawable getIconDrawable(int position);

        default String getTitleView(int position) {
            return "project" + position;
        }
    }


    public static class BaseMagicIndicator extends MagicIndicator {
        private Context context;

        public int dp(int v) {
            return Utils.dp(context, v);
        }

        public BaseMagicIndicator(Context context) {
            super(context);
            this.context = context;
        }

        public ImageView newIcon() {
            ImageView icon = new ImageView(context);
            int i = dp(20);
            icon.setLayoutParams(new LinearLayout.LayoutParams(i, i));
            return icon;
        }

        public ImageView getIcon(Drawable drawable) {
            ImageView icon = newIcon();
            icon.setImageDrawable(drawable);
            return icon;
        }

        public ImageView getIcon(int i) {
            ImageView icon = newIcon();
            icon.setImageResource(i);
            return icon;
        }

        public TextView newTitle() {
            TextView titleText = new TextView(context);
            LinearLayout.LayoutParams lp3 = new LinearLayout.LayoutParams(LayoutParams.WRAP_CONTENT, LayoutParams.WRAP_CONTENT);
            titleText.setLayoutParams(lp3);
            int v = dp(4);
            lp3.setMargins(v, v, v, v);
            return titleText;
        }

        public TextView getTitle(String s) {
            TextView title = newTitle();
            title.setText(s);
            return title;
        }

        public ViewGroup getCustomLayout() {
            LinearLayout customLayout = new LinearLayout(context);
            customLayout.setOrientation(customLayout.VERTICAL);
            customLayout.setGravity(0x11);
            int i = dp(4);
            customLayout.setPadding(i, 0, i, 0);
            customLayout.setBackgroundColor(0x00000000);
            customLayout.setLayoutParams(new LinearLayout.LayoutParams(LayoutParams.WRAP_CONTENT, LayoutParams.WRAP_CONTENT));
            return customLayout;
        }

        public ViewGroup getCustomLayout(ImageView icon, TextView title) {
            ViewGroup customLayout = getCustomLayout();
            if (icon != null) {
                customLayout.addView(icon);
            }
            if (title != null) {
                customLayout.addView(title);
            }
            customLayout.setLayoutParams(new LinearLayout.LayoutParams(LayoutParams.MATCH_PARENT, LayoutParams.MATCH_PARENT));

            return customLayout;
        }
    }

    public static class CommonPagerTitleViewImpl extends CommonPagerTitleView {

        public CommonPagerTitleViewImpl(Context context) {
            super(context);
        }


        public static class OnPagerTitleChangeListenerImpl implements OnPagerTitleChangeListener {
            private Impl Impl;

            public OnPagerTitleChangeListenerImpl(OnPagerTitleChangeListenerImpl.Impl impl) {
                Impl = impl;
            }


            public ImageView getIconView() {
                return Impl.getIconView();
            }

            public TextView getTitleView() {
                return Impl.getTitleView();
            }

            @Override
            public void onSelected(int index, int totalCount) {
                Impl.onSelected(index, totalCount);
            }

            @Override
            public void onDeselected(int index, int totalCount) {
                Impl.onDeselected(index, totalCount);
            }

            @Override
            public void onLeave(int index, int totalCount, float leavePercent, boolean leftToRight) {
                Impl.onLeave(index, totalCount, leavePercent, leftToRight);
            }

            @Override
            public void onEnter(int index, int totalCount, float enterPercent, boolean leftToRight) {
                Impl.onEnter(index, totalCount, enterPercent, leftToRight);
            }

            public interface Impl {
                ImageView getIconView();

                TextView getTitleView();

                default void onSelected(int index, int totalCount) {
                    TextView titleView = getTitleView();
                    if (titleView != null) {
                        titleView.setTextColor(Color.WHITE);
                    }
                }

                default void onDeselected(int index, int totalCount) {
                    TextView titleView = getTitleView();
                    if (titleView != null) {
                        titleView.setTextColor(Color.LTGRAY);
                    }
                }


                default void onLeave(int index, int totalCount, float leavePercent, boolean leftToRight) {
                    ImageView icon = getIconView();
                    if (icon != null) {
                        icon.setScaleX(1.3f + (0.8f - 1.3f) * leavePercent);
                        icon.setScaleY(1.3f + (0.8f - 1.3f) * leavePercent);
                    }
                }


                default void onEnter(int index, int totalCount, float enterPercent, boolean leftToRight) {
                    ImageView icon = getIconView();
                    if (icon != null) {
                        icon.setScaleX(0.8f + (1.3f - 0.8f) * enterPercent);
                        icon.setScaleY(0.8f + (1.3f - 0.8f) * enterPercent);
                    }
                }


            }


        }
    }

    public static class CommonNavigatorAdapterImpl extends CommonNavigatorAdapter {
        private Impl Impl;

        public CommonNavigatorAdapterImpl(CommonNavigatorAdapterImpl.Impl impl) {
            Impl = impl;
        }

        @Override
        public int getCount() {
            return Impl.getCount();
        }

        @Override
        public IPagerTitleView getTitleView(Context context, int index) {
            return Impl.getTitleView(context, index);
        }

        @Override
        public IPagerIndicator getIndicator(Context context) {
            return Impl.getIndicator(context);
        }

        public interface Impl {
            default int getCount() {
                return 0;
            }

            IPagerTitleView getTitleView(Context context, int index);

            IPagerIndicator getIndicator(Context context);
        }

    }

    public static class PagerAdapterImpl extends PagerAdapter {
        private Impl Impl;

        public PagerAdapterImpl(PagerAdapterImpl.Impl impl) {
            Impl = impl;
        }

        @Override
        public int getCount() {
            return Impl.getCount();
        }

        @Override
        public boolean isViewFromObject(@NonNull View view, @NonNull Object object) {
            return Impl.isViewFromObject(view, object);
        }

        @Override
        public void destroyItem(@NonNull ViewGroup container, int position, @NonNull Object object) {
            Impl.destroyItem(container, position, object);
        }


        @NonNull
        @Override
        public Object instantiateItem(@NonNull ViewGroup container, int position) {
            return Impl.instantiateItem(container, position);
        }

        public static interface Impl {
            default int getCount() {
                return 0;
            }

            default boolean isViewFromObject(@NonNull View view, @NonNull Object object) {
                return view == object;
            }

            default Object instantiateItem(@NonNull ViewGroup container, int position) {
                View view = getView(position);
                container.addView(view);
                return view;
            }

            default void destroyItem(@NonNull ViewGroup container, int position, @NonNull Object object) {
                container.removeView((View) object);
            }

            default View getView(int position) {
                String getView = "";
                try {
                    getView = this.getClass().getMethod("getView").toString();
                } catch (NoSuchMethodException e) {
                }
                throw new RuntimeException("Please implement the interface " + String.valueOf(getView) + " method");
            }

        }

    }
}