import 'package:flutter/material.dart';
import 'package:massaclinic/core/constant/AppColor.dart';
import 'package:massaclinic/core/constant/AppImagesAssets.dart';

class ComplaintCard extends StatelessWidget {
  const ComplaintCard({
    super.key,
    required this.title,
    required this.status,
    required this.color,
    this.personName,
    this.personImage,
    this.onEdit,
    this.onDelete,
    required this.created,
  });

  final String title;
  final String status;
  final Color color;
  final String? personName;
  final String? personImage;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;
  final String created;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColor.secondaryColor),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 2)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 24,
                backgroundImage:
                personImage != null?
                 NetworkImage(personImage!):AssetImage(AppImageAssets.person),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  personName!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: AppColor.gery800,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              PopupMenuButton<String>(
                borderRadius: BorderRadius.all(Radius.circular(3)),

                icon: const Icon(Icons.more_vert, color: AppColor.primaryColor),
                onSelected: (value) {
                  if (value == 'edit') {
                    if (onEdit != null) onEdit!();
                  } else if (value == 'delete') {
                    if (onDelete != null) onDelete!();
                  }
                },
                itemBuilder:
                    (context) => [
                      const PopupMenuItem(value: 'edit', child: Text('Edit')),
                      const PopupMenuItem(
                        value: 'delete',
                        child: Text('Delete'),
                      ),
                    ],
              ),
            ],
          ),

          const SizedBox(height: 12),

          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColor.gery800,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 15),
          // const Text(
          //   "Last Update: 17 Oct 2023",
          //   style: TextStyle(fontSize: 12, color: AppColor.gery800),
          // ),
          // const SizedBox(height: 4),
           Text(
            "Created: $created",
            style: TextStyle(fontSize: 12, color: AppColor.gery800),
          ),
          const SizedBox(height: 4),

          Align(
            alignment: Alignment.centerRight,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: color),
              ),
              child: Text(status, style: TextStyle(color: color, fontSize: 12)),
            ),
          ),
        ],
      ),
    );
  }
}
