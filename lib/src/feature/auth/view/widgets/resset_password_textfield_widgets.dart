import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:food_delivery/riverpod.dart";
import "package:food_delivery/src/core/constants/context_extension.dart";

import "login_button_widget.dart";

class RessetPasswordTextfieldWidgets extends ConsumerWidget {
  const RessetPasswordTextfieldWidgets({super.key});




  @override
  Widget build(BuildContext context, WidgetRef ref) => Form(
key: ref.read(authVm).resetEmailPasswordFromKey,
    child: Column(
          children: [
            Padding(
              padding:  REdgeInsets.symmetric(horizontal: 25.w),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  context.localized.password,
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.6),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
             SizedBox(
              height: 5.h,
            ),
            Padding(
              padding:  REdgeInsets.symmetric(horizontal: 25.w),
              child: TextFormField(
                obscureText: ref.read(authVm).loginEye,
                keyboardType: TextInputType.visiblePassword,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: const BorderSide(
                      color: Colors.orange,
                      width: 2,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: const BorderSide(
                        color: Colors.red,
                        width: 2,
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: const BorderSide(
                        color: Colors.red,
                        width: 2,
                      ),
                    ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide(
                      color: Colors.black.withOpacity(0.1),
                    ),
                  ),
                  suffixIcon: IconButton(
                    onPressed: ref.watch(authVm).loginEyeFunction,
                    icon: ref.read(authVm).loginEye
                        ? Icon(
                            Icons.visibility_rounded,
                            color: Colors.black.withOpacity(0.4),
                          )
                        : const Icon(Icons.visibility_off_rounded),
                  ),
                  hintText: context.localized.password,
                  hintStyle: TextStyle(
                    color: Colors.black.withOpacity(0.3),
                    fontSize: 16.sp,
                  ),
                ),
                validator: (value) {
                    final regex = RegExp(r"^(?=.*?[a-z])(?=.*?[0-9]).{8,}$");
                    return value != null && value.contains(regex)
                        ? null
                        : context.localized.mustbe;
                  },
              ),
            ),
              SizedBox(
                  height: 80.h,
                ),
                LoginButtonWidget(
                  NameText: context.localized.login,
                  onPressed: () => ref.watch(authVm).resetPasswordButtonFunction(context: context),
                ),
          ],
        ),
  );
}
