import 'package:flutter/material.dart';
import 'package:hangar_gym/config/colors.config.dart';
import 'package:hangar_gym/pages/widgets/background/background_screen.dart';
import 'package:hangar_gym/pages/widgets/homepage/program_container.dart';
import 'package:hangar_gym/views/appbar.dart';
import 'package:hangar_gym/views/bottombar.dart';


class AllPrograms extends StatelessWidget {
  const AllPrograms({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GradienBackground(
          child: CustomScrollView(
            slivers: <Widget>[
              const HeaderAppBar(),
              SliverToBoxAdapter(
                child: Padding(
                  
                  padding: const EdgeInsets.all(12.0),
                  
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 15),
                      const Text(
                        "Our Programs",
                        style: TextStyle(
                          fontSize: 26,
                          color: AppColors.white,
                        ),
                      ),
                      
                      const SizedBox(height: 20),
                      const ProgramContainer(),
                      const SizedBox(height: 20),
                      const ProgramContainer(),
                      const SizedBox(height: 20),
                      const ProgramContainer(),
                      const SizedBox(height: 20),
                      const ProgramContainer(),

                     

                      
                     
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const NavigationBottomBar(),
    );
  }
  
}
