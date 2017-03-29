package com.bigstark.interaction;

import android.animation.ObjectAnimator;
import android.animation.ValueAnimator;
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.support.annotation.Nullable;
import android.util.AttributeSet;
import android.view.View;

/**
 * Created by bigstark on 2017. 3. 29..
 */

public class CircleLoadingView extends View {

    public static final int DURATION_ROTATE_DEFAULT = 800;
    public static final int DURATION_INTERVAL_DEFAULT = 250;

    public static final int RADIUS_DEFAULT = 60;
    public static final int COLOR_DEFAULT = Color.parseColor("#7382C8");
    public static final int ALPHA_FINAL = 51; // 0 <= alpha <= 255, 51 -> 20%


    private int durationRotate = DURATION_ROTATE_DEFAULT;
    private int durationInterval = DURATION_INTERVAL_DEFAULT;

    private int radius = RADIUS_DEFAULT;
    private int color = COLOR_DEFAULT;

    private float offset = 0;


    private Paint paint = new Paint();

    public CircleLoadingView(Context context) {
        this(context, null);
    }

    public CircleLoadingView(Context context, @Nullable AttributeSet attrs) {
        this(context, attrs, 0);
    }

    public CircleLoadingView(Context context, @Nullable AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
    }


    @Override
    protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        int width = getWidth();
        int height = getHeight();

        resetPaint(0);
        float[] circleCenter = getHorizontalCenter(width, height, true);
        canvas.drawCircle(circleCenter[0], circleCenter[1], radius, paint);

        resetPaint(1);
        circleCenter = getVerticalCenter(width, height, true);
        canvas.drawCircle(circleCenter[0], circleCenter[1], radius, paint);

        resetPaint(2);
        circleCenter = getHorizontalCenter(width, height, false);
        canvas.drawCircle(circleCenter[0], circleCenter[1], radius, paint);

        resetPaint(3);
        circleCenter = getVerticalCenter(width, height, false);
        canvas.drawCircle(circleCenter[0], circleCenter[1], radius, paint);
    }

    private void resetPaint(int progress) {
        paint.reset();

        paint.setAntiAlias(true);
        paint.setStyle(Paint.Style.FILL);
        paint.setColor(color);

        if (progress < 3) {
            paint.setAlpha((int) (255 - (progress + offset) * (255 - ALPHA_FINAL) / 3));
        } else {
            paint.setAlpha((int) (ALPHA_FINAL + (255 - ALPHA_FINAL) * offset));
        }
    }

    private float[] getHorizontalCenter(int width, int height, boolean positive) {
        float x = (width - 2 * radius) * (positive ? offset : 1 - offset) + radius;
        float y = positive ? radius : height - radius;
        return new float[] {x, y};
    }

    private float[] getVerticalCenter(int width, int height, boolean negative) {
        float x = negative ? width - radius : radius;
        float y = (height - 2 * radius) * (negative ? offset : 1 - offset) + radius;
        return new float[] {x, y};
    }


    public void setRadius(int radius) {
        this.radius = radius;
        postInvalidate();
    }


    public void setColor(int color) {
        this.color = color;
        postInvalidate();
    }


    public void start() {
        ValueAnimator animator = ValueAnimator.ofInt(0, 1);
        animator.addUpdateListener(new ValueAnimator.AnimatorUpdateListener() {
            @Override
            public void onAnimationUpdate(ValueAnimator animation) {
//                offset = animation.getAnimatedFraction() * 4;
//                offset = offset - (int) offset;
                offset = animation.getAnimatedFraction();
                postInvalidate();
            }
        });
        animator.setDuration(durationRotate);
        animator.setStartDelay(durationInterval);
        animator.setRepeatCount(ObjectAnimator.INFINITE);
        animator.start();
    }
}
