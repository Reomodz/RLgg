package rlyun.modules.animation;

import android.animation.Animator;

import com.daimajia.androidanimations.library.Techniques;
import com.daimajia.androidanimations.library.YoYo;

import java.lang.reflect.Field;

public class YoYoImpl {

    public static YoYo.AnimationComposer with(String type) {
        Field[] fields = Techniques.class.getFields();
        for (Field field : fields) {
            if (field.getName().equals(type)) {
                try {
                    return YoYo.with((Techniques) field.get(null));
                } catch (IllegalAccessException e) {
                }
            }
        }
        return YoYo.with(Techniques.DropOut);
    }

    public static YoYo.AnimationComposer with(String type, int repeat) {
        return with(type).repeat(repeat);
    }

    public static YoYo.AnimationComposer setRepeat(YoYo.AnimationComposer yoyo, int repeat) {
        return yoyo.repeat(repeat);
    }

    public static class IAnimatorCallback implements YoYo.AnimatorCallback {
        private Impl Impl;

        public IAnimatorCallback(Impl impl) {
            Impl = impl;
        }

        @Override
        public void call(Animator animator) {
            Impl.call(animator);
        }

        public static interface Impl {
            default void call(Animator animator) {
            }
        }

    }


}
